package com.rob.proxpertgaragebackendv2.controllers;

import com.rob.proxpertgaragebackendv2.models.dtos.OrdenTrabajoCreateRequestDTO;
import com.rob.proxpertgaragebackendv2.models.dtos.OrdenTrabajoUpdateRequestDTO;
import com.rob.proxpertgaragebackendv2.models.entities.OrdenTrabajo;
import com.rob.proxpertgaragebackendv2.models.services.OrdenTrabajoService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api-rest/ordenes")
public class OrdenTrabajoController {

    private final OrdenTrabajoService ordenTrabajoService;

    @GetMapping
    public ResponseEntity<List<OrdenTrabajo>> getAllOrdenes() {
        return ResponseEntity.ok(ordenTrabajoService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrdenTrabajo> getOrdenById(@PathVariable Integer id) {
        return ResponseEntity.ok(ordenTrabajoService.findById(id));
    }

    @PostMapping
    public ResponseEntity<OrdenTrabajo> createOrden(@Valid @RequestBody OrdenTrabajoCreateRequestDTO dto) {
        OrdenTrabajo created = ordenTrabajoService.createOrdenTrabajo(dto);
        return new ResponseEntity<>(created, HttpStatus.CREATED);
    }

    @PutMapping
    public ResponseEntity<OrdenTrabajo> updateOrden(@Valid @RequestBody OrdenTrabajoUpdateRequestDTO dto) {
        try {
            OrdenTrabajo updated = ordenTrabajoService.updateOrdenTrabajo(dto);
            return ResponseEntity.ok(updated);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrden(@PathVariable Integer id) {
        ordenTrabajoService.deleteOrdenTrabajo(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/recientes")
    public List<OrdenTrabajo> getRecentOrders(@RequestParam(defaultValue = "5") int quantity) {
        return ordenTrabajoService.findMostRecentOrders(quantity);
    }
}
