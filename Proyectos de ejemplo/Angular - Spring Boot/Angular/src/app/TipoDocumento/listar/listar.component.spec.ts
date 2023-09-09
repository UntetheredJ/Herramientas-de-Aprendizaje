import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListarComponentTipoDocumento } from './listar.component';

describe('ListarComponentCiudad', () => {
  let component: ListarComponentTipoDocumento;
  let fixture: ComponentFixture<ListarComponentTipoDocumento>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListarComponentTipoDocumento ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ListarComponentTipoDocumento);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
