import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ServiceService } from 'src/app/Service/service.service';
import { Ciudad } from 'src/app/Modelo/Ciudad';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css']
})
export class EditComponentCiudad implements OnInit{
  ciudad:Ciudad = new Ciudad();
  constructor(private router:Router, private service:ServiceService){}

  ngOnInit(): void{
    this.Edit();
  }

  Edit(){
    let id = localStorage.getItem("id");
    this.service.getCiudadId(+id!)
    .subscribe(data=>{
      this.ciudad = data;
    })
  }

  Actualizar(ciudad:Ciudad){
    this.service.updateCiudad(ciudad)
    .subscribe(data=>{
      alert("Se actualizó con éxito!");
      this.router.navigate(["listarCiudad"]);
    })
  }
}
