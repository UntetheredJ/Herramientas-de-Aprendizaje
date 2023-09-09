import { Ciudad } from "./Ciudad";
import { TipoDocumento } from "./TipoDocumento";

export class Persona{
    id!: number;
    nombres!: String;
    apellidos!: String;
    documento!: String;
    fechaNacimiento!: Date;
    email!: String;
    telefono!: number;
    usuario!: String;
    password!: String;
    ciudad!: Ciudad;
    tipoDocumento!: TipoDocumento;
}