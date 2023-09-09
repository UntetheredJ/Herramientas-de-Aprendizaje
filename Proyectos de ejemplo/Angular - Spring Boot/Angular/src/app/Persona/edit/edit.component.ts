import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ServiceService } from 'src/app/Service/service.service';
import { Persona } from 'src/app/Modelo/Persona';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css']
})
export class EditComponentPersona implements OnInit{
  persona:Persona = new Persona();
  
  constructor(private router:Router, private service:ServiceService){}

  ngOnInit(): void{
    this.Edit();
  }

  Edit(){
    let id = localStorage.getItem("id");
    this.service.getPersonaId(+id!)
    .subscribe(data=>{
      this.persona = data;
    })
  }

  Actualizar(persona:Persona){
    this.service.updatePersona(persona)
    .subscribe(data=>{
      alert("Se actualizó con éxito!");
      this.router.navigate(["listarPersona"]);
    })
  }
}
