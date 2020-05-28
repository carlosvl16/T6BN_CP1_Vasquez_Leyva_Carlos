package com.example.demo.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entidad.Cliente;
import com.example.demo.repositorio.ClienteRepositorio;
import com.example.demo.servicio.ClienteServicio;

@Service
public class ClienteServiciolmpl implements ClienteServicio{
	
	@Autowired
	private ClienteRepositorio repositorio;
	
	@Override
	public Cliente insertaCliente(Cliente obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

}
