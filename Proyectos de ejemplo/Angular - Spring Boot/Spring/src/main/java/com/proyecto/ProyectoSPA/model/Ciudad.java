package com.proyecto.ProyectoSPA.model;

import jakarta.persistence.*;

@Entity
@Table(name="ciudades")
public class Ciudad{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(name="nombre", nullable=false)
	private String nombre;
	@Column(name="descripcion", nullable=false)
	private String descripcion;
	
	public Ciudad() {
		
	}
	
	public Ciudad(String nombre, String descripcion) {
		this.nombre = nombre;
		this.descripcion = descripcion;
	}
	
	// Id
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	// Nombre
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	// Descripcion
	public String getDescripcion() {
		return descripcion;
	}
		
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
}