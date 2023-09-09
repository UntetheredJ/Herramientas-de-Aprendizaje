import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ServiceService } from 'src/app/Service/service.service';
import { Persona } from 'src/app/Modelo/Persona';

@Component({
  selector: 'app-listar',
  templateUrl: './listar.component.html',
  styleUrls: ['./listar.component.css']
})
export class ListarComponentPersona implements OnInit {
  personas: Persona[] = [];
  constructor(private service:ServiceService, private router:Router){ }

  ngOnInit(): void{
    this.service.getPersonas()
    .subscribe(data=>{
      this.personas = data;
    })
  }

  Edit(persona:Persona):void{
    localStorage.setItem("id",persona.id.toString());
    this.router.navigate(["editPersona"]);
  }  

  Delete(persona:Persona){
    this.service.deletePersona(persona)
    .subscribe(data=>{
      this.personas= this.personas.filter(p=>p!==persona);
      alert("Persona eleminada!!");
    })
  }
}
