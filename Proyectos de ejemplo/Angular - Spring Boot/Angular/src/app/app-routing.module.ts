import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ListarComponentPersona } from './Persona/listar/listar.component';
import { AddComponentPersona } from './Persona/add/add.component';
import { EditComponentPersona } from './Persona/edit/edit.component';
import { ListarComponentCiudad } from './Ciudad/listar/listar.component';
import { AddComponentCiudad } from './Ciudad/add/add.component';
import { EditComponentCiudad } from './Ciudad/edit/edit.component';
import { ListarComponentTipoDocumento } from './TipoDocumento/listar/listar.component';
import { AddComponentTipoDocumento } from './TipoDocumento/add/add.component';
import { EditComponentTipoDocumento } from './TipoDocumento/edit/edit.component';

const routes: Routes = [
  {path:'listarPersona',component:ListarComponentPersona},
  {path:'addPersona',component:AddComponentPersona},
  {path:'editPersona',component:EditComponentPersona},

  {path:'listarCiudad', component:ListarComponentCiudad},
  {path:'addCiudad', component:AddComponentCiudad},
  {path:'editCiudad', component:EditComponentCiudad},

  {path:'listarTipoDocumento', component:ListarComponentTipoDocumento},
  {path:'addTipoDocumento', component:AddComponentTipoDocumento},
  {path:'editTipoDocumento', component:EditComponentTipoDocumento}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
