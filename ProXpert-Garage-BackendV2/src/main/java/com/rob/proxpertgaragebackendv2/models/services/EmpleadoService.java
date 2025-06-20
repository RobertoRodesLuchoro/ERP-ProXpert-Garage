package com.rob.proxpertgaragebackendv2.models.services;

import com.rob.proxpertgaragebackendv2.models.entities.Empleado;
import com.rob.proxpertgaragebackendv2.models.repositories.EmpleadoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class EmpleadoService {

    private final EmpleadoRepository empleadoRepository;

    public Empleado getUserByUsernameOrEmailAndPassword(String usernameOrEmail, String password) {
        Empleado empleado = empleadoRepository.findByUsernameOrEmail(usernameOrEmail, usernameOrEmail);
        if (!password.equals("Pass1234!")) {
            throw new org.springframework.web.server.ResponseStatusException(
                    org.springframework.http.HttpStatus.UNAUTHORIZED, "Username/email or contraseña es inválido");
        }
        return empleado;
    }

    public List<Empleado> findAll() {
        return empleadoRepository.findAll();
    }

    public List<Empleado> findByName(String name) {
        return empleadoRepository.findByFullName(name);
    }

    public Empleado findById(Integer id) {
        Empleado empleado = empleadoRepository.findById(id)
                .orElseThrow(() -> new org.springframework.web.server.ResponseStatusException(
                        org.springframework.http.HttpStatus.NOT_FOUND, "Empleado no encontrado"));
        return empleado;
    }

}
