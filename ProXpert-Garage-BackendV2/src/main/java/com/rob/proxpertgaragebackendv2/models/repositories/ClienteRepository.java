package com.rob.proxpertgaragebackendv2.models.repositories;

import com.rob.proxpertgaragebackendv2.models.entities.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClienteRepository extends JpaRepository<Cliente, Integer> {
}