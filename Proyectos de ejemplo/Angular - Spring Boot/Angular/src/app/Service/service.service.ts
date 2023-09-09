import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Persona } from '../Modelo/Persona';
import { Ciudad } from '../Modelo/Ciudad';
import { TipoDocumento } from '../Modelo/TipoDocumento';

@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http:HttpClient) { }
  personaUrl='http://localhost:8080/api/v1/persona';
  ciudadUrl='http://localhost:8080/api/v1/ciudad';
  tipoDocUrl='http://localhost:8080/api/v1/tipoDocumento';

  // PERSONA
  getPersonas(){
    return this.http.get<Persona[]>(this.personaUrl);
  }

  createPersona(persona:Persona){
    return this.http.post<Persona>(this.personaUrl, persona);
  }

  getPersonaId(id:Number){
    return this.http.get<Persona>(this.personaUrl + "/" + id);
  }

  updatePersona(persona:Persona){
    return this.http.put(this.personaUrl + "/" + persona.id, persona);
  }

  deletePersona(persona:Persona){
    return this.http.delete(this.personaUrl + "/" + persona.id);
  }

  // CIUDAD
  getCiudades(){
    return this.http.get<Ciudad[]>(this.ciudadUrl);
  }

  createCiudad(ciudad:Ciudad){
    return this.http.post<Ciudad>(this.ciudadUrl, ciudad);
  }

  getCiudadId(id:Number){
    return this.http.get<Ciudad>(this.ciudadUrl + "/" + id);
  }

  updateCiudad(ciudad:Ciudad){
    return this.http.put(this.ciudadUrl + "/" + ciudad.id, ciudad);
  }

  deleteCiudad(ciudad:Ciudad){
    return this.http.delete(this.ciudadUrl + "/" + ciudad.id);
  }

  // TIPO DOCUMENTO
  getTipoDocumentos(){
    return this.http.get<TipoDocumento[]>(this.tipoDocUrl);
  }

  createTipoDocumento(tipoDocumento:TipoDocumento){
    return this.http.post<TipoDocumento>(this.tipoDocUrl, tipoDocumento);
  }

  getTipoDocumentoId(id:Number){
    return this.http.get<TipoDocumento>(this.tipoDocUrl + "/" + id);
  }

  updateTipoDocumento(tipoDocumento:TipoDocumento){
    return this.http.put(this.tipoDocUrl + "/" + tipoDocumento.id, tipoDocumento);
  }

  deleteTipoDocumento(tipoDocumento:TipoDocumento){
    return this.http.delete(this.tipoDocUrl + "/" + tipoDocumento.id);
  }
}
