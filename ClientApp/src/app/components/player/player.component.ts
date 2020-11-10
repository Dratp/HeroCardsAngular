import { Component } from '@angular/core';
import { PlayerService } from '../../services/player.service';

@Component({
    selector: 'app-player',
    templateUrl: './player.component.html',
    styleUrls: ['./player.component.css']
})
/** player component*/
export class PlayerComponent {
  /** player ctor */
  constructor(private playerService: PlayerService) {
    }
}
