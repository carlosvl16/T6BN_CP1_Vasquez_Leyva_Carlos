package com.example.demo.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entidad.Tipo;

public interface TipoRepositorio extends JpaRepository<Tipo, Integer> {

}
