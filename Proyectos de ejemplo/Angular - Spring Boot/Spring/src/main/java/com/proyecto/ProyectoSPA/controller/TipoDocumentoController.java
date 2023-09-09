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

import com.proyecto.ProyectoSPA.model.TipoDocumento;
import com.proyecto.ProyectoSPA.repository.TipoDocumentoRepository;
import com.proyecto.ProyectoSPA.exception.ResourceNotFoundException;

@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
@RestController
@RequestMapping("/api/v1")
public class TipoDocumentoController{
	@Autowired 
	private TipoDocumentoRepository tipoDocumentoRepository;
	
	@GetMapping("/tipoDocumento")
	public List<TipoDocumento> getAllTipoDocumentos(){
		return tipoDocumentoRepository.findAll();
	}

	@GetMapping("/tipoDocumento/{id}")
	public ResponseEntity<TipoDocumento> getTipoDocumentoById(@PathVariable(value="id") Long tipoDocumentoId)
		throws ResourceNotFoundException{
		TipoDocumento tipoDocumento = tipoDocumentoRepository.findById(tipoDocumentoId)
				.orElseThrow(() -> new ResourceNotFoundException("TipoDocumento not found for this id :: " + tipoDocumentoId));
		return ResponseEntity.ok().body(tipoDocumento);
	}
	
	@PostMapping("/tipoDocumento")
    public TipoDocumento createTipoDocumento(@Valid @RequestBody TipoDocumento tipoDocumento) {
        return tipoDocumentoRepository.save(tipoDocumento);
    }
	
	@PutMapping("/tipoDocumento/{id}")
    public ResponseEntity<TipoDocumento> updateTipoDocumento(@PathVariable(value = "id") Long tipoDocumentoId,
         @Valid @RequestBody TipoDocumento tipoDocumentoDetails) throws ResourceNotFoundException {
		TipoDocumento tipoDocumento = tipoDocumentoRepository.findById(tipoDocumentoId)
        .orElseThrow(() -> new ResourceNotFoundException("TipoDocumento not found for this id :: " + tipoDocumentoId));

		tipoDocumento.setNombre(tipoDocumentoDetails.getNombre());
		tipoDocumento.setDescripcion(tipoDocumentoDetails.getDescripcion());
        final TipoDocumento updatedTipoDocumento = tipoDocumentoRepository.save(tipoDocumento);
        return ResponseEntity.ok(updatedTipoDocumento);
    }
	
	@DeleteMapping("/tipoDocumento/{id}")
	public Map<String, Boolean> deletePersona(@PathVariable(value="id") Long tipoDocumentoId)
		throws ResourceNotFoundException{
		TipoDocumento tipoDocumento = tipoDocumentoRepository.findById(tipoDocumentoId)
		.orElseThrow(() -> new ResourceNotFoundException("TipoDocumento not found for this id :: " + tipoDocumentoId));
		
		tipoDocumentoRepository.delete(tipoDocumento);
		Map<String, Boolean> response = new HashMap<>();
		response.put("deleted", Boolean.TRUE);
		return response;
	}
}