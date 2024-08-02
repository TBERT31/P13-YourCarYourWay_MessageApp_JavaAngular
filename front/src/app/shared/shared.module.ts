import { NgModule } from '@angular/core';
import { MaterialModule } from './material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { TruncatePipe } from './pipe/truncate.pipe';


@NgModule({
  declarations: [
    TruncatePipe,
  ],
  imports: [
    ReactiveFormsModule,
    FormsModule, 
    RouterModule,
    MaterialModule,
  ],
  exports: [
    TruncatePipe,
    ReactiveFormsModule,
    MaterialModule, 
    FormsModule,
  ]
})
export class SharedModule { }