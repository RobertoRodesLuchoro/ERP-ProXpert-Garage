package com.rob.proxpertgaragebackendv2.models.repositories;

import com.rob.proxpertgaragebackendv2.models.entities.Empleado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EmpleadoRepository extends JpaRepository<Empleado, Integer> {
    Empleado findByUsernameOrEmail(String username, String email);
    @Query("SELECT e FROM Empleado e WHERE LOWER(CONCAT(e.nombre, ' ', e.apellidos)) LIKE LOWER(CONCAT('%', :nameAndLastName, '%'))")
    List<Empleado> findByFullName(@Param("nameAndLastName") String nameAndLastName);
}