package com.proyecto.ProyectoSPA.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.proyecto.ProyectoSPA.model.Ciudad;

@Repository
public interface CiudadRepository extends JpaRepository<Ciudad, Long>{
	
}