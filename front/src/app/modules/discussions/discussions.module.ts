import { LOCALE_ID, NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DiscussionsRoutingModule } from './discussions-routing.module';
import { registerLocaleData } from '@angular/common';
import localeFr from '@angular/common/locales/fr';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedModule } from '../../modules/shared/shared.module';
import { DiscussionsListComponent } from './components/discussions-list/discussions-list.component';
import { DiscussionsFormComponent } from './components/discussions-form/discussions-form.component';
import { DiscussionsDetailComponent } from './components/discussions-detail/discussions-detail.component';
registerLocaleData(localeFr);

@NgModule({
  declarations: [
    
  
    DiscussionsListComponent,
             DiscussionsFormComponent,
             DiscussionsDetailComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    DiscussionsRoutingModule,
    SharedModule,
  ],
  providers: [
    {
      provide: LOCALE_ID,
      useValue: 'fr-FR'
    },
  ]
})
export class DiscussionsModule { }
