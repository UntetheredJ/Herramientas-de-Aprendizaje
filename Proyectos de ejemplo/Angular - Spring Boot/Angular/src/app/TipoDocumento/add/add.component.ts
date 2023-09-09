import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ServiceService } from 'src/app/Service/service.service';
import { TipoDocumento } from 'src/app/Modelo/TipoDocumento';


@Component({
  selector: 'app-add',
  templateUrl: './add.component.html',
  styleUrls: ['./add.component.css']
})
export class AddComponentTipoDocumento implements OnInit{
  tipoDocumento: TipoDocumento = new TipoDocumento();

  constructor(private router:Router, private service:ServiceService){}

  ngOnInit(): void {
      
  }

  Guardar(){
    this.service.createTipoDocumento(this.tipoDocumento)
    .subscribe(data=>{
      alert("Se ha agregado con éxito!");
      this.router.navigate(["listarTipoDocumento"]);
    })
  }
}
