package com.rob.proxpertgaragebackendv2.models.repositories;

import com.rob.proxpertgaragebackendv2.models.entities.Producto;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductoRepository extends JpaRepository<Producto, Integer> {
    @Query("SELECT p FROM Producto p ORDER BY p.id DESC")
    List<Producto> findMostRecent(Pageable pageable);
}