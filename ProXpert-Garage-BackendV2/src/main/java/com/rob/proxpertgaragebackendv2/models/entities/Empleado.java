package com.rob.proxpertgaragebackendv2.models.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "empleados")
public class Empleado {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "empleado_id", nullable = false)
    private Integer id;

    @Size(max = 50)
    @NotNull
    @Column(name = "rol", nullable = false, length = 50)
    private String rol;

    @Size(max = 50)
    @NotNull
    @Column(name = "username", nullable = false, length = 50)
    private String username;

    @Size(max = 100)
    @NotNull
    @Column(name = "email", nullable = false, length = 100)
    private String email;

    @NotNull
    @Column(name = "hashed_password", nullable = false, length = Integer.MAX_VALUE)
    private String hashedPassword;

    @Size(max = 100)
    @Column(name = "nombre", length = 100)
    private String nombre;

    @Size(max = 100)
    @Column(name = "apellidos", length = 100)
    private String apellidos;

    @Size(max = 100)
    @Column(name = "puesto", length = 100)
    private String puesto;

    @Column(name = "precio_hora", precision = 10, scale = 2)
    private BigDecimal precioHora;

    @Size(max = 20)
    @Column(name = "telefono_movil", length = 20)
    private String telefonoMovil;

    @Size(max = 100)
    @Column(name = "localidad", length = 100)
    private String localidad;

}