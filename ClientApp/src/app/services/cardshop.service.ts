import { Injectable } from '@angular/core';
import { HeroActionCard } from '../interfaces/hero-action-card';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CardshopService {
  cardsForSale: HeroActionCard[];

  constructor(private http: HttpClient) {
    this.PopulateStore();
  }

  apiUrl = '/api/Store';

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

}
