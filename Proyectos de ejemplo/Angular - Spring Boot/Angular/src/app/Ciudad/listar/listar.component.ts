import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ServiceService } from 'src/app/Service/service.service';
import { Ciudad } from 'src/app/Modelo/Ciudad';

@Component({
  selector: 'app-listar',
  templateUrl: './listar.component.html',
  styleUrls: ['./listar.component.css']
})
export class ListarComponentCiudad implements OnInit {
  ciudades: Ciudad[] = [];
  constructor(private service:ServiceService, private router:Router){ }

  ngOnInit(): void{
    this.service.getCiudades()
    .subscribe(data=>{
      this.ciudades = data;
    })
  }

  Edit(ciudad:Ciudad):void{
    localStorage.setItem("id",ciudad.id.toString());
    this.router.navigate(["editCiudad"]);
  }  

  Delete(ciudad:Ciudad){
    this.service.deleteCiudad(ciudad)
    .subscribe(data=>{
      this.ciudades= this.ciudades.filter(p=>p!==ciudad);
      alert("Ciudad eleminada!!");
    })
  }
}
