import { NgModule } from '@angular/core';
import { MaterialModule } from './material.module';
import { ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';


@NgModule({
  declarations: [

  ],
  imports: [
    ReactiveFormsModule,
    RouterModule,
    MaterialModule,
  ],
  exports: [
    ReactiveFormsModule,
    MaterialModule, 
  ]
})
export class SharedModule { }