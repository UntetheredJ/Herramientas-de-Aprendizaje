package com.proyecto.ProyectoSPA.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.proyecto.ProyectoSPA.model.Persona;

@Repository
public interface PersonaRepository extends JpaRepository<Persona, Long>{
	
}