import { TestBed } from '@angular/core/testing';

import { CardshopService } from './cardshop.service';

describe('CardshopService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: CardshopService = TestBed.get(CardshopService);
    expect(service).toBeTruthy();
  });
});
