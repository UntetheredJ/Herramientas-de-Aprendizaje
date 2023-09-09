import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListarComponentPersona } from './listar.component';

describe('ListarComponentPersona', () => {
  let component: ListarComponentPersona;
  let fixture: ComponentFixture<ListarComponentPersona>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListarComponentPersona ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ListarComponentPersona);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
