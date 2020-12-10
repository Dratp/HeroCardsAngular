import { Component, OnInit } from '@angular/core';
import { HeroActionCard } from '../../interfaces/hero-action-card';
import { PlayerInfo } from '../../interfaces/player';
import { CardshopService } from '../../services/cardshop.service';
import { PlayerService } from '../../services/player.service';

@Component({
  selector: 'app-cardshop',
  templateUrl: './cardshop.component.html',
  styleUrls: ['./cardshop.component.css']
})
export class CardshopComponent implements OnInit {
  amount: number;
  startAmount: number;
  playInfo: PlayerInfo
  playerID: number;
  theCard: HeroActionCard;

  constructor(private player: PlayerService, private cardShop: CardshopService) { }

  ngOnInit() {
    this.startAmount = 3;
    this.amount = this.startAmount;
  }

  Refresh(amount) {
    this.cardShop.RefreshStore(this.amount);
    this.ResetAmount();
  }

  ResetAmount() {
    this.amount = this.startAmount;
  }

  AddOne() {
    this.amount++;
  }

  DisplayCard(card: HeroActionCard) {
    this.theCard = card;
  }

  BuyCard() {

  }
}
