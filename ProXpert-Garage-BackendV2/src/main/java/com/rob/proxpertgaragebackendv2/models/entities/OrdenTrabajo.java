package com.rob.proxpertgaragebackendv2.models.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "ordenes_trabajo")
public class OrdenTrabajo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "orden_id", nullable = false)
    private Integer id;

    @Column(name = "fecha_inicio")
    private LocalDate fechaInicio;

    @Column(name = "fecha_fin")
    private LocalDate fechaFin;

    @Size(max = 50)
    @ColumnDefault("'En curso'")
    @Column(name = "estado", length = 50)
    private String estado;

    @Column(name = "precio_total", precision = 10, scale = 2)
    private BigDecimal precioTotal;

    @Size(max = 100)
    @Column(name = "cliente", length = 100)
    private String cliente;

    @Size(max = 100)
    @Column(name = "vehiculo", length = 100)
    private String vehiculo;

    @Size(max = 7)
    @Column(name = "matricula", length = 7)
    private String matricula;

}