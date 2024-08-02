import { NgModule } from '@angular/core';
import { MaterialModule } from './material.module';
import { ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { TruncatePipe } from './pipe/truncate.pipe';


@NgModule({
  declarations: [
    TruncatePipe,
  ],
  imports: [
    ReactiveFormsModule,
    RouterModule,
    MaterialModule,
  ],
  exports: [
    TruncatePipe,
    ReactiveFormsModule,
    MaterialModule, 
  ]
})
export class SharedModule { }