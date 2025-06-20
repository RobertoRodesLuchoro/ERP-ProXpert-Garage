package com.rob.proxpertgaragebackendv2.models.services;

import com.rob.proxpertgaragebackendv2.models.dtos.OrdenTrabajoCreateRequestDTO;
import com.rob.proxpertgaragebackendv2.models.dtos.OrdenTrabajoUpdateRequestDTO;
import com.rob.proxpertgaragebackendv2.models.entities.OrdenTrabajo;
import com.rob.proxpertgaragebackendv2.models.repositories.OrdenTrabajoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrdenTrabajoService {

    private final OrdenTrabajoRepository ordenTrabajoRepository;
    private final PresupuestoService presupuestoService;

    public List<OrdenTrabajo> findAll() {
        return ordenTrabajoRepository.findAll();
    }

    public OrdenTrabajo findById(Integer id) {
        return ordenTrabajoRepository.findById(id)
                .orElseThrow(() -> new org.springframework.web.server.ResponseStatusException(
                        org.springframework.http.HttpStatus.NOT_FOUND, "Orden de trabajo no encontrada"));
    }

    public OrdenTrabajo createOrdenTrabajo(OrdenTrabajoCreateRequestDTO ordenTrabajoCreateRequestDTO) {
        OrdenTrabajo nuevaOrden = new OrdenTrabajo();

        nuevaOrden.setCliente(ordenTrabajoCreateRequestDTO.getCliente());
        nuevaOrden.setVehiculo(ordenTrabajoCreateRequestDTO.getVehiculo());
        nuevaOrden.setMatricula(ordenTrabajoCreateRequestDTO.getMatricula());
        nuevaOrden.setFechaInicio(ordenTrabajoCreateRequestDTO.getFechaInicio());
        nuevaOrden.setFechaFin(ordenTrabajoCreateRequestDTO.getFechaFin());
        nuevaOrden.setEstado(ordenTrabajoCreateRequestDTO.getEstado());
        nuevaOrden.setPrecioTotal(ordenTrabajoCreateRequestDTO.getPrecioTotal());

        return ordenTrabajoRepository.save(nuevaOrden);
    }


    public OrdenTrabajo updateOrdenTrabajo(OrdenTrabajoUpdateRequestDTO ordenTrabajoUpdateRequestDTO) {
        OrdenTrabajo ordenExistente = ordenTrabajoRepository.findById(ordenTrabajoUpdateRequestDTO.getId())
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Orden de trabajo no encontrada"));

        ordenExistente.setCliente(ordenTrabajoUpdateRequestDTO.getCliente());
        ordenExistente.setVehiculo(ordenTrabajoUpdateRequestDTO.getVehiculo());
        ordenExistente.setMatricula(ordenTrabajoUpdateRequestDTO.getMatricula());
        ordenExistente.setFechaInicio(ordenTrabajoUpdateRequestDTO.getFechaInicio());
        ordenExistente.setFechaFin(ordenTrabajoUpdateRequestDTO.getFechaFin());
        ordenExistente.setEstado(ordenTrabajoUpdateRequestDTO.getEstado());
        ordenExistente.setPrecioTotal(ordenTrabajoUpdateRequestDTO.getPrecioTotal());

        return ordenTrabajoRepository.save(ordenExistente);
    }


    public boolean deleteOrdenTrabajo(Integer id) {
        OrdenTrabajo orden = ordenTrabajoRepository.findById(id)
                .orElseThrow(() -> new org.springframework.web.server.ResponseStatusException(
                        org.springframework.http.HttpStatus.NOT_FOUND, "Orden de trabajo no encontrada"));
        ordenTrabajoRepository.deleteById(id);
        return true;
    }


    public List<OrdenTrabajo> findMostRecentOrders(int quantity) {
        Pageable pageable = PageRequest.of(0, quantity);
        return ordenTrabajoRepository.findMostRecent(pageable);
    }
}
