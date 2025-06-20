package com.rob.proxpertgaragebackendv2.controllers;

import com.rob.proxpertgaragebackendv2.models.dtos.LoginRequestDTO;
import com.rob.proxpertgaragebackendv2.models.entities.Empleado;
import com.rob.proxpertgaragebackendv2.models.services.EmpleadoService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api-rest/users")
public class LoginController {

    private final EmpleadoService empleadoService;

    @PostMapping("/login")
    public ResponseEntity<Empleado> getUserByUsernameOrEmailAndPassword(@Valid @RequestBody LoginRequestDTO loginRequest) {
        Empleado empleado = empleadoService.getUserByUsernameOrEmailAndPassword(loginRequest.getUsernameOrEmail(), loginRequest.getPassword());
        log.info("Solicitud POST /users/login recibida con datos: {}", loginRequest);
        log.info("Usuario autenticado: {}", empleado.getUsername());
        return ResponseEntity.ok(empleado);
    }
}
