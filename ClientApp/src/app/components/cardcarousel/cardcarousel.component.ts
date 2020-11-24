import { Component, EventEmitter, Input, Output } from '@angular/core';
import { HeroActionCard } from '../../interfaces/hero-action-card';

@Component({
    selector: 'app-cardcarousel',
    templateUrl: './cardcarousel.component.html',
    styleUrls: ['./cardcarousel.component.css']
})
/** cardcarousel component*/
export class CardcarouselComponent {
  @Input() cardlist: HeroActionCard[];
  @Output() theCard = new EventEmitter<HeroActionCard>();
  chosenCard: number;
  start: number;
  amount: number;
  numbers: number[];

    constructor() {
      
    }

  ngOnInit() {
    this.start = 0;
    this.numbers = [];
    this.amount = 4;
    this.fillnumbers();
  }

  plusOne() {
    this.start++;
  }

  minusOne() {
    this.start--;
  }

  fillnumbers() {
    for (let i = 0; i < this.amount; i++) {
      this.numbers.push(i);
    }
  }

  onSelectCard(cardnum: number): void {
    let card: HeroActionCard = this.cardlist[cardnum];
    this.theCard.emit(card);
    this.chosenCard = cardnum;
    console.log(this.chosenCard);
  }

}
