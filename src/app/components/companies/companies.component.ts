import { Component } from '@angular/core';
import { Utils } from 'src/app/utils/utils';

@Component({
  selector: 'app-companies',
  templateUrl: './companies.component.html',
  styleUrls: ['./companies.component.scss'],
})
export class CompaniesComponent {
  public lists: Array<any> = Utils.companiesList();
}
