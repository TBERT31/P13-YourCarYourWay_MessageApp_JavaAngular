import { Component, OnDestroy } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
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
        Validators.maxLength(50)
      ]
    ],
    lastname: [
      '',
      [
        Validators.required,
        Validators.minLength(3),
        Validators.maxLength(50)
      ]
    ],
    streetNumber: [
      '',
      [
        Validators.required,
      ]
    ],
    streetName: [
      '',
      [
        Validators.required,
      ]
    ],
    city: [
      '',
      [
        Validators.required,
      ]
    ],
    zipcode: [
      '',
      [
        Validators.required,
      ]
    ],
    country: [
      '',
      [
        Validators.required,
      ]
    ],
    birthDate: [
      '',
      [
        Validators.required
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
            birthDate: formValue.birthDate ? new Date(formValue.birthDate) : new Date(), 
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
}