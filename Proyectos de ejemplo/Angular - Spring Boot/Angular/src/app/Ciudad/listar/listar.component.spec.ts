import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListarComponentCiudad } from './listar.component';

describe('ListarComponentCiudad', () => {
  let component: ListarComponentCiudad;
  let fixture: ComponentFixture<ListarComponentCiudad>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListarComponentCiudad ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ListarComponentCiudad);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
