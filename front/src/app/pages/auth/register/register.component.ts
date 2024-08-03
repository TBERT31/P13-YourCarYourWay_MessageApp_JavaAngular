import { Component, OnDestroy, signal } from '@angular/core';
import { AbstractControl, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Subject, takeUntil } from 'rxjs';
import { User } from 'src/app/core/interfaces/user.interface';
import { AuthService } from 'src/app/core/services/auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnDestroy {
  public onError = false;
  private destroy$ = new Subject<void>();

  private readonly passwordPattern = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=,?;./:!§£*()-_¨µ<>{}]).{8,}$/;
  private readonly namePattern = /^[A-Za-zÀ-ÖØ-öø-ÿ\s'-]{3,50}$/; 
  private readonly streetNumberPattern = /^[0-9A-Za-z\s-]{1,10}$/; 
  private readonly streetNamePattern = /^[A-Za-zÀ-ÖØ-öø-ÿ0-9\s',-]{3,100}$/; 
  private readonly cityPattern = /^[A-Za-zÀ-ÖØ-öø-ÿ\s'-]{2,50}$/;
  private readonly zipcodePattern = /^[0-9A-Za-z\s-]{4,10}$/;
  private readonly countryPattern = /^[A-Za-zÀ-ÖØ-öø-ÿ\s'-]{2,50}$/; 



  public form = this.fb.group({
    email: [
      '',
      [
        Validators.required,
        Validators.email,
        Validators.minLength(3),
        Validators.maxLength(50)
      ]
    ],
    password: [
      '',
      [
        Validators.required,
        Validators.minLength(8),
        Validators.maxLength(255),
        Validators.pattern(this.passwordPattern) 
      ]
    ],
    firstname: [
      '',
      [
        Validators.required,
        Validators.minLength(3),
        Validators.maxLength(50),
        Validators.pattern(this.namePattern)
      ]
    ],
    lastname: [
      '',
      [
        Validators.required,
        Validators.minLength(3),
        Validators.maxLength(50),
        Validators.pattern(this.namePattern)
      ]
    ],
    streetNumber: [
      '',
      [
        Validators.required,
        Validators.pattern(this.streetNumberPattern),
        Validators.maxLength(10)
      ]
    ],
    streetName: [
      '',
      [
        Validators.required,
        Validators.minLength(3),
        Validators.maxLength(100),
        Validators.pattern(this.streetNamePattern)
      ]
    ],
    city: [
      '',
      [
        Validators.required,
        Validators.minLength(2),
        Validators.maxLength(50),
        Validators.pattern(this.cityPattern)
      ]
    ],
    zipcode: [
      '',
      [
        Validators.required,
        Validators.pattern(this.zipcodePattern),
        Validators.minLength(4),
        Validators.maxLength(10)
      ]
    ],
    country: [
      '',
      [
        Validators.required,
        Validators.minLength(2),
        Validators.maxLength(50),
        Validators.pattern(this.countryPattern)
      ]
    ],
    birthDate: [
      '',
      [
        Validators.required,
        this.pastDateValidator()
      ]
    ],
  });

  constructor(private authService: AuthService,
              private fb: FormBuilder,
              private router: Router
  ) {}

  public submit(): void {
    if (this.form.valid) {
        const formValue = this.form.value;

        const registerRequest: User = {
            id: 0, 
            email: formValue.email ?? '', 
            password: formValue.password ?? '',
            firstname: formValue.firstname ?? '',
            lastname: formValue.lastname ?? '',
            address: `${formValue.streetNumber} ${formValue.streetName} - ${formValue.city} ${formValue.zipcode}, ${formValue.country}`  ?? '',
            birthDate: formValue.birthDate 
              ? (function() {
                  const date = new Date(formValue.birthDate);
                  date.setDate(date.getDate() + 1);
                  return date.toISOString().substring(0, 10);
                })()
              : '',
            admin: false, 
        };

        this.authService.register(registerRequest).pipe(
            takeUntil(this.destroy$)
        ).subscribe({
            next: (_: User) => this.router.navigate(['/login']),
            error: _ => this.onError = true,
        });
    }
}

  ngOnDestroy(): void {
    this.destroy$.next(); 
    this.destroy$.complete(); 
  }

  private pastDateValidator() {
    return (control: AbstractControl) => {
      const today = new Date();
      const birthDate = new Date(control.value);

      return birthDate < today ? null : { futureDate: true }; 
    };
  }

  hide = signal(true);
  clickEvent(event: MouseEvent) {
    this.hide.set(!this.hide());
    event.stopPropagation();
  }
}