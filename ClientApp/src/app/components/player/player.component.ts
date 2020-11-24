import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player.service';
import { PlayerInfo, Player } from '../../interfaces/player';
import { Router } from '@angular/router';
import { LogInService } from '../../services/log-in.service';
import { Observable, of } from 'rxjs';
import { HeroActionCard } from '../../interfaces/hero-action-card';


@Component({
  selector: 'app-player',
  templateUrl: './player.component.html',
  styleUrls: ['./player.component.css']
})

/** player component*/
export class PlayerComponent implements OnInit {

  playInfo: PlayerInfo
  playerID: number;
  theCard: HeroActionCard;
  

  constructor(private playerLogIn: LogInService, private playerService: PlayerService, private router: Router) {
    this.playerID = playerLogIn.playerID
  }

  ngOnInit() {
    console.log(this.playerLogIn.playerID);
    this.playerService.getPlayer(this.playerLogIn.playerID);

  }

  DisplayCard(card: HeroActionCard) {
    this.theCard = card;
  }

}
