import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { ServiceService } from './Service/service.service';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ListarComponentPersona } from './Persona/listar/listar.component';
import { AddComponentPersona } from './Persona/add/add.component';
import { EditComponentPersona } from './Persona/edit/edit.component';

import { ListarComponentCiudad } from './Ciudad/listar/listar.component';
import { AddComponentCiudad } from './Ciudad/add/add.component';
import { EditComponentCiudad } from './Ciudad/edit/edit.component';

import { ListarComponentTipoDocumento } from './TipoDocumento/listar/listar.component';
import { AddComponentTipoDocumento } from './TipoDocumento/add/add.component';
import { EditComponentTipoDocumento } from './TipoDocumento/edit/edit.component';

@NgModule({
  declarations: [
    AppComponent,
    ListarComponentPersona,
    AddComponentPersona,
    EditComponentPersona,
    ListarComponentCiudad,
    AddComponentCiudad,
    EditComponentCiudad,
    ListarComponentTipoDocumento,
    AddComponentTipoDocumento,
    EditComponentTipoDocumento
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [ServiceService],
  bootstrap: [AppComponent]
})
export class AppModule { }
