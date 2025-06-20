package com.rob.proxpertgaragebackendv2.models.services;

import com.rob.proxpertgaragebackendv2.models.entities.Presupuesto;
import com.rob.proxpertgaragebackendv2.models.repositories.PresupuestoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PresupuestoService {

    private final PresupuestoRepository presupuestoRepository;

    public List<Presupuesto> findAll() {
        return presupuestoRepository.findAll();
    }

    public Presupuesto findById(Integer id) {
        return presupuestoRepository.findById(id)
                .orElseThrow(() -> new org.springframework.web.server.ResponseStatusException(
                        org.springframework.http.HttpStatus.NOT_FOUND, "Presupuesto no encontrado"));
    }

    public List<Presupuesto> findByVehiculoId(Integer vehiculoId) {
        return presupuestoRepository.findByVehiculo_Id(vehiculoId);
    }

    public List<Presupuesto> findByClienteId(Integer clienteId) {
        return presupuestoRepository.findByCliente_Id(clienteId);
    }

    public List<Presupuesto> findMostRecent(int cantidad) {
        Pageable pageable = PageRequest.of(0, cantidad);
        return presupuestoRepository.findMostRecent(pageable);
    }
}
