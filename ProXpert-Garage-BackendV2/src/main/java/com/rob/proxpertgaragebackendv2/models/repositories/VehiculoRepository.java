package com.rob.proxpertgaragebackendv2.models.repositories;

import com.rob.proxpertgaragebackendv2.models.entities.Vehiculo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VehiculoRepository extends JpaRepository<Vehiculo, Integer> {
}