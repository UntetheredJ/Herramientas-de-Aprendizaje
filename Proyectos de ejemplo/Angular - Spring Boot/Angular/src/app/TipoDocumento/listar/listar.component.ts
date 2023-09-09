import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ServiceService } from 'src/app/Service/service.service';
import { TipoDocumento } from 'src/app/Modelo/TipoDocumento';

@Component({
  selector: 'app-listar',
  templateUrl: './listar.component.html',
  styleUrls: ['./listar.component.css']
})
export class ListarComponentTipoDocumento implements OnInit {
  tipoDocumentos: TipoDocumento[] = [];
  constructor(private service:ServiceService, private router:Router){ }

  ngOnInit(): void{
    this.service.getTipoDocumentos()
    .subscribe(data=>{
      this.tipoDocumentos = data;
    })
  }

  Edit(tipoDocumento:TipoDocumento):void{
    localStorage.setItem("id",tipoDocumento.id.toString());
    this.router.navigate(["editTipoDocumento"]);
  }  

  Delete(tipoDocumento:TipoDocumento){
    this.service.deleteTipoDocumento(tipoDocumento)
    .subscribe(data=>{
      this.tipoDocumentos= this.tipoDocumentos.filter(p=>p!==tipoDocumento);
      alert("TipoDocumento eleminado!!");
    })
  }
}
