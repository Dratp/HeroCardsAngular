import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player.service';
import { PlayerInfo } from '../../interfaces/player';
import { Router } from '@angular/router';

@Component({
  selector: 'app-player',
  templateUrl: './player.component.html',
  styleUrls: ['./player.component.css']
})

/** player component*/
export class PlayerComponent implements OnInit {
  playerInfo: PlayerInfo;

  /** player ctor */
  constructor(private playerService: PlayerService, private route: Router) {
   
  }


  ngOnInit() {
  }

  login(name: string) {


  }
}
