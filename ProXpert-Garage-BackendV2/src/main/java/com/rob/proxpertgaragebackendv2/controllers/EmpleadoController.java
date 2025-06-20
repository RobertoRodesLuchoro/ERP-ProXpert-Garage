package com.rob.proxpertgaragebackendv2.controllers;

import com.rob.proxpertgaragebackendv2.models.entities.Empleado;
import com.rob.proxpertgaragebackendv2.models.services.EmpleadoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api-rest/empleados")
public class EmpleadoController {

    private final EmpleadoService empleadoService;

    @GetMapping()
    public ResponseEntity<List<Empleado>> getAllEmpleados(@RequestParam(value = "nombre", required = false) String nombre){
        List<Empleado> empleados;
        if(nombre == null || nombre.isEmpty())
            empleados = empleadoService.findAll();
        else
            empleados = empleadoService.findByName(nombre);
        if (empleados.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(empleados);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Empleado> getEmpleadoById(@PathVariable(value = "id") Integer id) {
        Empleado empleado = empleadoService.findById(id);
        if (empleado == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(empleado);
    }
}
