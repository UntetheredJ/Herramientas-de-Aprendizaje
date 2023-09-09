import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditComponentPersona } from './edit.component';

describe('EditComponentPersona', () => {
  let component: EditComponentPersona;
  let fixture: ComponentFixture<EditComponentPersona>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditComponentPersona ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditComponentPersona);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
