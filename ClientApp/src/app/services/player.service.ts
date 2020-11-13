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

  }

  apiUrl = '/api/player';

  getPlayer(playerID: number){
    this.http.get<Player>(`${this.apiUrl}/${playerID}`).subscribe(result =>
    {
      console.log(result);
      return this.currentPlayer = result;
    })
   
  }


  //getPlayerData(playerID: number) {
  //  this.getPlayer(playerID).subscribe(results => { this.setPlayer(results) })
  //  console.log('playerID at getPlayerData', playerID)

  //}

  //setPlayer(signInPlayer: Player) {
  //  this.currentPlayer = signInPlayer;

  //  console.log(this.currentPlayer.name + "at setPlayer")
  //}


  //playerAPICall(playerID: number):Observable<Player> {
  // return  this.http.get<Player>(this.apiUrl + {playerID})
  //}

  //playerSubscribe(playerID: number) {
  // return this.playerAPICall(this.playerID).subscribe(results => this.setCurrentPlayer(results))
  //}

  //setCurrentPlayer(player: Player) {
  //  return this.currentPlayer = player
  //}
}
