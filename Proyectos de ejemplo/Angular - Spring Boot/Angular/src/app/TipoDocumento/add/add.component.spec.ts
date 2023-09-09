import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddComponentTipoDocumento } from './add.component';

describe('AddComponent', () => {
  let component: AddComponentTipoDocumento;
  let fixture: ComponentFixture<AddComponentTipoDocumento>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddComponentTipoDocumento ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AddComponentTipoDocumento);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
