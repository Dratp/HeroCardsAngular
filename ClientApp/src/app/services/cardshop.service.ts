import { Injectable } from '@angular/core';
import { HeroActionCard } from '../interfaces/hero-action-card';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CardshopService {
  cardsForSale: HeroActionCard[];

  constructor(private http: HttpClient) {
    this.cardsForSale = [];
  }

  apiUrl = '/api/Store';

  // Leaving this working code for test purposes can test a shop with no player logged in.
  PopulateStore() {
    this.GetCards().subscribe(results => this.cardsForSale = results);
  }

  GetCards() {
    return (this.http.get<HeroActionCard[]>(`${this.apiUrl}/cards/CardShop`));
  }

  RefreshStore(num: number) {
    this.ClearShop().subscribe(results => this.GetNewCards(num).subscribe(results => this.cardsForSale = results));
  }

  ClearShop() {
    return (this.http.get<{ bool, string }>(`${this.apiUrl}/cards/ClearCardShop`));
  }

  GetNewCards(num: number) {
    return (this.http.get<HeroActionCard[]>(`${this.apiUrl}/cards/${num}`));
  }

  // This is production for a player logged into the game.  Oringally had an issue where all players shared the same card shop.
  PopulatePlayerCardShop(playerID: number) {
    this.GetCardsForPlayer(playerID).subscribe(results => this.cardsForSale = results);
  }

  GetCardsForPlayer(playerID: number) {
    return (this.http.get<HeroActionCard[]>(`${this.apiUrl}/cards/CardShop/${playerID}`));
  }

  RefreshPlayerStore(num: number, playerID: number) {
    console.log("Refresh player store called");
    this.ClearPlayerShop(playerID).subscribe(results => this.GetNewCardsForPlayer(num, playerID).subscribe(results => this.cardsForSale = results));
  }

  ClearPlayerShop(playerID: number) {
    console.log("Clear Player Shop called");
    return (this.http.get<{ bool, string }>(`${this.apiUrl}/cards/ClearCardShop/${playerID}`));
  }

  GetNewCardsForPlayer(num: number, playerID: number) {
    console.log("Get New Cards for player called");
    return (this.http.get<HeroActionCard[]>(`${this.apiUrl}/cards/${num}/${playerID}`));
  }
}
