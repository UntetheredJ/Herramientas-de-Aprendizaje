package com.proyecto.ProyectoSPA.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.proyecto.ProyectoSPA.model.Ciudad;
import com.proyecto.ProyectoSPA.repository.CiudadRepository;
import com.proyecto.ProyectoSPA.exception.ResourceNotFoundException;

@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
@RestController
@RequestMapping("/api/v1")
public class CiudadController{
	@Autowired 
	private CiudadRepository ciudadRepository;
	
	@GetMapping("/ciudad")
	public List<Ciudad> getAllCiudades(){
		return ciudadRepository.findAll();
	}

	@GetMapping("/ciudad/{id}")
	public ResponseEntity<Ciudad> getCiudadById(@PathVariable(value="id") Long ciudadId)
		throws ResourceNotFoundException{
		Ciudad ciudad = ciudadRepository.findById(ciudadId)
				.orElseThrow(() -> new ResourceNotFoundException("Ciudad not found for this id :: " + ciudadId));
		return ResponseEntity.ok().body(ciudad);
	}
	
	@PostMapping("/ciudad")
    public Ciudad createPersona(@Valid @RequestBody Ciudad ciudad) {
        return ciudadRepository.save(ciudad);
    }
	
	@PutMapping("/ciudad/{id}")
    public ResponseEntity<Ciudad> updatePersona(@PathVariable(value = "id") Long ciudadId,
         @Valid @RequestBody Ciudad ciudadDetails) throws ResourceNotFoundException {
		Ciudad ciudad = ciudadRepository.findById(ciudadId)
        .orElseThrow(() -> new ResourceNotFoundException("Ciudad not found for this id :: " + ciudadId));

		ciudad.setNombre(ciudadDetails.getNombre());
		ciudad.setDescripcion(ciudadDetails.getDescripcion());
        final Ciudad updatedCiudad = ciudadRepository.save(ciudad);
        return ResponseEntity.ok(updatedCiudad);
    }
	
	@DeleteMapping("/ciudad/{id}")
	public Map<String, Boolean> deletePersona(@PathVariable(value="id") Long ciudadId)
		throws ResourceNotFoundException{
		Ciudad ciudad = ciudadRepository.findById(ciudadId)
		.orElseThrow(() -> new ResourceNotFoundException("Ciudad not found for this id :: " + ciudadId));
		
		ciudadRepository.delete(ciudad);
		Map<String, Boolean> response = new HashMap<>();
		response.put("deleted", Boolean.TRUE);
		return response;
	}
}