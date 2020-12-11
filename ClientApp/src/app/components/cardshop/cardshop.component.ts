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

  constructor(private playerService: PlayerService, private cardShop: CardshopService) { }

  ngOnInit() {
    this.startAmount = 3;
    this.amount = this.startAmount;
  }

  Refresh(amount) {
    this.cardShop.RefreshPlayerStore(this.amount, this.playerService.currentPlayer.playerID);
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
