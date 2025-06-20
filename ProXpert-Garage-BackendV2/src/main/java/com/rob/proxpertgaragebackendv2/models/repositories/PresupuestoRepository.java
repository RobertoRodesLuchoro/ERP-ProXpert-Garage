package com.rob.proxpertgaragebackendv2.models.repositories;

import com.rob.proxpertgaragebackendv2.models.entities.Presupuesto;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PresupuestoRepository extends JpaRepository<Presupuesto, Integer> {
    List<Presupuesto> findByCliente_Id(Integer clienteId);
    @Query("SELECT p FROM Presupuesto p ORDER BY p.id DESC")
    List<Presupuesto> findMostRecent(Pageable pageable);

    List<Presupuesto> findByVehiculo_Id(Integer vehiculoId);
}