import { Injectable } from '@angular/core';
import { LogInService } from './log-in.service';
import { HttpClient } from '@angular/common/http';
import { Player } from './../interfaces/player';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PlayerService {
  currentPlayer: Player;
  playerID: number;
  player: Player;


  constructor(private http: HttpClient, playerLogIn: LogInService) {
    this.player = {Name : ' ', PlayerID : 0, Currency : 0  };
  }

  apiUrl = '/api/player/' ;

  playerAPICall(playerID: number):Observable<Player> {
   return  this.http.get<Player>(this.apiUrl + {playerID})
  }

  playerSubscribe(playerID: number) {
   return this.playerAPICall(this.playerID).subscribe(results => this.setCurrentPlayer(results))
  }

  setCurrentPlayer(player: Player) {
    return this.currentPlayer = player
  }
}
