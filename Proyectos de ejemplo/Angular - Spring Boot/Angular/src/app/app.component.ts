import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Angular';

  constructor(private router:Router){}

  ListarPersona(){
    this.router.navigate(["listarPersona"]);
  }
  NuevaPersona(){
    this.router.navigate(["addPersona"]);
  }

  ListarCiudad(){
    this.router.navigate(["listarCiudad"]);
  }
  NuevaCiudad(){
    this.router.navigate(["addCiudad"])
  }

  ListarTipoDocumento(){
    this.router.navigate(["listarTipoDocumento"])
  }

  NuevoTipoDocumento(){
    this.router.navigate(["addTipoDocumento"])
  }
}
