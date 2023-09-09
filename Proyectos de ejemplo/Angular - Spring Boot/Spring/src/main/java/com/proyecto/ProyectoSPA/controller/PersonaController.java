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

import com.proyecto.ProyectoSPA.model.Persona;
import com.proyecto.ProyectoSPA.repository.PersonaRepository;
import com.proyecto.ProyectoSPA.exception.ResourceNotFoundException;

@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
@RestController
@RequestMapping("/api/v1")
public class PersonaController{
	@Autowired 
	private PersonaRepository personaRepository;
	
	@GetMapping("/persona")
	public List<Persona> getAllPersonas(){
		return personaRepository.findAll();
	}

	@GetMapping("/persona/{id}")
	public ResponseEntity<Persona> getPersonaById(@PathVariable(value="id") Long personaId)
		throws ResourceNotFoundException{
		Persona persona = personaRepository.findById(personaId)
				.orElseThrow(() -> new ResourceNotFoundException("Persona not found for this id :: " + personaId));
		return ResponseEntity.ok().body(persona);
	}
	
	@PostMapping("/persona")
    public Persona createPersona(@Valid @RequestBody Persona persona) {
		return personaRepository.save(persona);
    }
	
	@PutMapping("/persona/{id}")
    public ResponseEntity<Persona> updatePersona(@PathVariable(value = "id") Long personaId,
         @Valid @RequestBody Persona personaDetails) throws ResourceNotFoundException {
		Persona persona = personaRepository.findById(personaId)
        .orElseThrow(() -> new ResourceNotFoundException("Persona not found for this id :: " + personaId));
		
		persona.setNombres(personaDetails.getNombres());
		persona.setApellidos(personaDetails.getApellidos());
		persona.setDocumento(personaDetails.getDocumento());
		persona.setFechaNacimiento(personaDetails.getFechaNacimiento());
		persona.setEmail(personaDetails.getEmail());
		persona.setTelefono(personaDetails.getTelefono());
		persona.setUsuario(personaDetails.getUsuario());
		persona.setPassword(personaDetails.getPassword());
		persona.setCiudad(personaDetails.getCiudad());
		persona.setTipoDocumento(personaDetails.getTipoDocumento());
        final Persona updatedPersona = personaRepository.save(persona);
        return ResponseEntity.ok(updatedPersona);
    }
	
	@DeleteMapping("/persona/{id}")
	public Map<String, Boolean> deletePersona(@PathVariable(value="id") Long personaId)
		throws ResourceNotFoundException{
		Persona persona = personaRepository.findById(personaId)
		.orElseThrow(() -> new ResourceNotFoundException("Persona not found for this id :: " + personaId));
		
		personaRepository.delete(persona);
		Map<String, Boolean> response = new HashMap<>();
		response.put("deleted", Boolean.TRUE);
		return response;
	}
}