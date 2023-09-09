import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditComponentCiudad } from './edit.component';

describe('EditComponentCiudad', () => {
  let component: EditComponentCiudad;
  let fixture: ComponentFixture<EditComponentCiudad>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditComponentCiudad ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditComponentCiudad);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
