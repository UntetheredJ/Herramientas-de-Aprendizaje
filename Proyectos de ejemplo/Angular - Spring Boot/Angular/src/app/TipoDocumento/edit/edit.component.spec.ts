import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditComponentTipoDocumento } from './edit.component';

describe('EditComponentCiudad', () => {
  let component: EditComponentTipoDocumento;
  let fixture: ComponentFixture<EditComponentTipoDocumento>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditComponentTipoDocumento ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditComponentTipoDocumento);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
