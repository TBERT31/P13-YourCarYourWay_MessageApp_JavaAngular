import { NgModule } from '@angular/core';
import { MaterialModule } from './material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { TruncatePipe } from './pipe/truncate.pipe';
import { ScrollToBottomDirective } from './directives/scroll-to-bottom.directive';


@NgModule({
  declarations: [
    TruncatePipe,
    ScrollToBottomDirective,
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
    ScrollToBottomDirective
  ]
})
export class SharedModule { }