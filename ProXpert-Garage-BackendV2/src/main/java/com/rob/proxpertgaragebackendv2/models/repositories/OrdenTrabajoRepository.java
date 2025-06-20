package com.rob.proxpertgaragebackendv2.models.repositories;

import com.rob.proxpertgaragebackendv2.models.entities.OrdenTrabajo;
import com.rob.proxpertgaragebackendv2.models.entities.Presupuesto;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrdenTrabajoRepository extends JpaRepository<OrdenTrabajo, Integer> {
    @Query("SELECT ot FROM OrdenTrabajo ot ORDER BY ot.id DESC")
    List<OrdenTrabajo> findMostRecent(Pageable pageable);
}