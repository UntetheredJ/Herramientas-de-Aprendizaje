import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddComponentPersona } from './add.component';

describe('AddComponentPersona', () => {
  let component: AddComponentPersona;
  let fixture: ComponentFixture<AddComponentPersona>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddComponentPersona ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AddComponentPersona);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
