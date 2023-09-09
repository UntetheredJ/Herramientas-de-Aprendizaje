import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ServiceService } from 'src/app/Service/service.service';
import { Persona } from 'src/app/Modelo/Persona';
import { Ciudad } from 'src/app/Modelo/Ciudad';
import { TipoDocumento } from 'src/app/Modelo/TipoDocumento';

@Component({
  selector: 'app-add',
  templateUrl: './add.component.html',
  styleUrls: ['./add.component.css']
})
export class AddComponentPersona implements OnInit{
  persona: Persona = new Persona();
  ciudades:Ciudad[] = [];
  tipoDocumentos:TipoDocumento[] = [];
  constructor(private router:Router, private service:ServiceService){}

  ngOnInit(): void {
    this.service.getCiudades()
    .subscribe(data=>{
      this.ciudades = data;
    })

    this.service.getTipoDocumentos()
    .subscribe(data=>{
      this.tipoDocumentos = data;
    })
  }

  Guardar(){
    this.service.createPersona(this.persona)
    .subscribe(data=>{
      alert("Se ha agregado con éxito!");
      this.router.navigate(["listarPersona"]);
    })
  }
}
