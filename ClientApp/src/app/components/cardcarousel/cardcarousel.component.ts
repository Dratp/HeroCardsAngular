import { Component, Input } from '@angular/core';
import { HeroActionCard } from '../../interfaces/hero-action-card';

@Component({
    selector: 'app-cardcarousel',
    templateUrl: './cardcarousel.component.html',
    styleUrls: ['./cardcarousel.component.css']
})
/** cardcarousel component*/
export class CardcarouselComponent {
  @Input() cardlist: HeroActionCard[];
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

}
