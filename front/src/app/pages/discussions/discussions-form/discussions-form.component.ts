import { Component } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-discussions-form',
  templateUrl: './discussions-form.component.html',
  styleUrls: ['./discussions-form.component.scss'],
})
export class DiscussionsFormComponent {
  public title: string = ''; // Ajoutez une propriété pour stocker le titre

  constructor(public dialogRef: MatDialogRef<DiscussionsFormComponent>) {}

  onNoClick(): void {
    this.dialogRef.close();
  }
}
