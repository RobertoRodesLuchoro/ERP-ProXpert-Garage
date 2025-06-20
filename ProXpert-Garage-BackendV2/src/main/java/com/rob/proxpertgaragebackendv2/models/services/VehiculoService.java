package com.rob.proxpertgaragebackendv2.models.services;

import com.rob.proxpertgaragebackendv2.models.entities.Vehiculo;
import com.rob.proxpertgaragebackendv2.models.repositories.VehiculoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class VehiculoService {

    private final VehiculoRepository vehiculoRepository;

    public List<Vehiculo> findAll() {
        return vehiculoRepository.findAll();
    }

    public Vehiculo findById(Integer id) {
        return vehiculoRepository.findById(id)
                .orElseThrow(() -> new org.springframework.web.server.ResponseStatusException(
                        org.springframework.http.HttpStatus.NOT_FOUND, "Vehículo no encontrado"));
    }
}
