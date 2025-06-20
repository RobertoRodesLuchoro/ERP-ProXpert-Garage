package com.rob.proxpertgaragebackendv2.models.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "clientes")
public class Cliente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cliente_id", nullable = false)
    private Integer id;

    @Size(max = 100)
    @NotNull
    @Column(name = "nombre", nullable = false, length = 100)
    private String nombre;

    @Size(max = 100)
    @Column(name = "apellidos", length = 100)
    private String apellidos;

    @Size(max = 9)
    @Column(name = "nif", length = 9)
    private String nif;

    @Size(max = 100)
    @Column(name = "email", length = 100)
    private String email;

    @Size(max = 20)
    @Column(name = "telefono_movil", length = 20)
    private String telefonoMovil;

    @Size(max = 100)
    @Column(name = "localidad", length = 100)
    private String localidad;

}