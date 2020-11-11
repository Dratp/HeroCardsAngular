import { Component } from '@angular/core';
import { LogInService } from '../services/log-in.service';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export class HomeComponent {
  constructor(playerLogin: LogInService) { }
}
