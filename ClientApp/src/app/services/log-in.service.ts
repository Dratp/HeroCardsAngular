import { Injectable } from '@angular/core';
import { Player, PlayerInfo } from '../interfaces/player';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class LogInService {
  name: string;
  response: boolean;
  reason: string;
  playerID: number;

  apiUrl = 'api/logIn';

  constructor(private http: HttpClient, private route: Router) {
    this.name = "";
    this.response = false;
    this.reason = "";
    this.playerID = 0;
  }

  authplayer(name: string): Observable<PlayerInfo> {
    return this.http.get<PlayerInfo>(`${this.apiUrl}/login/${name}`)
  }

  signIn(name: string) {
    this.authplayer(name).subscribe(results => this.setPlayer(results));
  }

  setPlayer(playerInfo: PlayerInfo) {
    this.playerID = playerInfo.PlayerID
    this.response = playerInfo.response
    this.reason = playerInfo.reason
    console.log(playerInfo.PlayerID)
    if (playerInfo.response) {
      this.route.navigate([""])
    }
  }

}
