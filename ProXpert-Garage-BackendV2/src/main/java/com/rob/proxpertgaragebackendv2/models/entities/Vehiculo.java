package com.rob.proxpertgaragebackendv2.models.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Getter
@Setter
@Entity
@Table(name = "vehiculos")
public class Vehiculo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "vehiculo_id", nullable = false)
    private Integer id;

    @Size(max = 15)
    @NotNull
    @Column(name = "matricula", nullable = false, length = 15)
    private String matricula;

    @ManyToOne(fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "cliente_id")
    private Cliente cliente;

    @Size(max = 50)
    @Column(name = "marca", length = 50)
    private String marca;

    @Size(max = 50)
    @Column(name = "modelo", length = 50)
    private String modelo;

    @Column(name = "anyo")
    private Integer anyo;

    @Size(max = 50)
    @Column(name = "tipo_vehiculo", length = 50)
    private String tipoVehiculo;

    @Size(max = 50)
    @Column(name = "color", length = 50)
    private String color;

}