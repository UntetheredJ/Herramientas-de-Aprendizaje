import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ServiceService } from 'src/app/Service/service.service';
import { Ciudad } from 'src/app/Modelo/Ciudad';


@Component({
  selector: 'app-add',
  templateUrl: './add.component.html',
  styleUrls: ['./add.component.css']
})
export class AddComponentCiudad implements OnInit{
  ciudad: Ciudad = new Ciudad();

  constructor(private router:Router, private service:ServiceService){}

  ngOnInit(): void {
      
  }

  Guardar(){
    this.service.createCiudad(this.ciudad)
    .subscribe(data=>{
      alert("Se ha agregado con éxito!");
      this.router.navigate(["listarCiudad"]);
    })
  }
}
