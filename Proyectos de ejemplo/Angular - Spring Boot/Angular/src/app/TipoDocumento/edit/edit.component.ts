import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ServiceService } from 'src/app/Service/service.service';
import { TipoDocumento } from 'src/app/Modelo/TipoDocumento';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css']
})
export class EditComponentTipoDocumento implements OnInit{
  tipoDocumento:TipoDocumento = new TipoDocumento();
  constructor(private router:Router, private service:ServiceService){}

  ngOnInit(): void{
    this.Edit();
  }

  Edit(){
    let id = localStorage.getItem("id");
    this.service.getTipoDocumentoId(+id!)
    .subscribe(data=>{
      this.tipoDocumento = data;
    })
  }

  Actualizar(tipoDocumento:TipoDocumento){
    this.service.updateTipoDocumento(tipoDocumento)
    .subscribe(data=>{
      alert("Se actualizó con éxito!");
      this.router.navigate(["listarTipoDocumento"]);
    })
  }
}
