import { Component } from '@angular/core';
import { LogInService } from '../services/log-in.service';
import { PlayerInfo } from '../interfaces/player';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export class HomeComponent {

  playInfo: PlayerInfo
   playerID: number;
  constructor(private playerLogIn: LogInService) {

    this.playerID = playerLogIn.playerID
  }
}
