import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddComponentCiudad } from './add.component';

describe('AddComponent', () => {
  let component: AddComponentCiudad;
  let fixture: ComponentFixture<AddComponentCiudad>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddComponentCiudad ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AddComponentCiudad);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
