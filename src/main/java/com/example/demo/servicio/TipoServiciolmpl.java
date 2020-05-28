package com.example.demo.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entidad.Tipo;
import com.example.demo.repositorio.TipoRepositorio;
import com.example.demo.servicio.TipoServicio;

@Service
public class TipoServiciolmpl implements TipoServicio{
	
	@Autowired
	private TipoRepositorio repositorio;

	@Override
	public List<Tipo> listaTipo() {
		return repositorio.findAll();
	}

}
