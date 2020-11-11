import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { LogInService } from '../../services/log-in.service';
import { PlayerInfo } from '../../interfaces/player';

@Component({
    selector: 'app-log-in',
    templateUrl: './log-in.component.html',
    styleUrls: ['./log-in.component.css']
})
/** logIn component*/
export class LogInComponent {

  playerInfo: PlayerInfo;
  /** logIn ctor */
  constructor(private route: Router, private playerLogIn: LogInService)  {
    this.playerInfo = { Name: " " };
  }


  ngOnInit() {
  }

  login(name: string) {
    if (name != "") {
      this.playerLogIn.signIn(name);
    }

  }
}
