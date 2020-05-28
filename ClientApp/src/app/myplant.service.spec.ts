import { TestBed } from '@angular/core/testing';

import { MyplantService } from './myplant.service';

describe('MyplantService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: MyplantService = TestBed.get(MyplantService);
    expect(service).toBeTruthy();
  });
});
