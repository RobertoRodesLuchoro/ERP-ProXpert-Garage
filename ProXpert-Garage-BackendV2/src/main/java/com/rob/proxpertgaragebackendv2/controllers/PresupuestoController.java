package com.rob.proxpertgaragebackendv2.controllers;

import com.rob.proxpertgaragebackendv2.models.entities.Presupuesto;
import com.rob.proxpertgaragebackendv2.models.services.PresupuestoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api-rest/presupuestos")
public class PresupuestoController {

    private final PresupuestoService presupuestoService;

    @GetMapping
    public ResponseEntity<List<Presupuesto>> getAllPresupuestos() {
        return ResponseEntity.ok(presupuestoService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Presupuesto> getPresupuestoById(@PathVariable Integer id) {
        return ResponseEntity.ok(presupuestoService.findById(id));
    }

    @GetMapping("/vehiculo/{vehiculoId}")
    public ResponseEntity<List<Presupuesto>> getPresupuestosByVehiculoId(@PathVariable Integer vehiculoId) {
        return ResponseEntity.ok(presupuestoService.findByVehiculoId(vehiculoId));
    }

    @GetMapping("/cliente/{clienteId}")
    public ResponseEntity<List<Presupuesto>> getPresupuestosByClienteId(@PathVariable Integer clienteId) {
        return ResponseEntity.ok(presupuestoService.findByClienteId(clienteId));
    }

    @GetMapping("/recientes")
    public ResponseEntity<List<Presupuesto>> getMostRecentPresupuestos(
            @RequestParam(defaultValue = "5") int cantidad) {
        return ResponseEntity.ok(presupuestoService.findMostRecent(cantidad));
    }
}
