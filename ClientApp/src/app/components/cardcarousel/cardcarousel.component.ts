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

    constructor() {

    }

  ngOnInit() {
    this.start = 0;
    this.amount = 4;
  }

}
