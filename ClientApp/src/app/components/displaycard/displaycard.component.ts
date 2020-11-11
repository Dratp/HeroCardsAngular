import { Component, Input } from '@angular/core';
import { HeroActionCard } from '../../interfaces/hero-action-card';

@Component({
    selector: 'app-displaycard',
    templateUrl: './displaycard.component.html',
    styleUrls: ['./displaycard.component.css']
})
/** displaycard component*/
export class DisplaycardComponent {
  @Input() card: HeroActionCard;

    constructor() {

    }
}
