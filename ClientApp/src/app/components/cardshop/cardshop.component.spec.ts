import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CardshopComponent } from './cardshop.component';

describe('CardshopComponent', () => {
  let component: CardshopComponent;
  let fixture: ComponentFixture<CardshopComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CardshopComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CardshopComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
