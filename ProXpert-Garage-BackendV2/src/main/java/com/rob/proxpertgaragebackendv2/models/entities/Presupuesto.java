package com.rob.proxpertgaragebackendv2.models.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
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
@Table(name = "presupuestos")
public class Presupuesto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "presupuesto_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "cliente_id")
    private Cliente cliente;

    @NotNull
    @ColumnDefault("CURRENT_DATE")
    @Column(name = "fecha_creacion", nullable = false)
    private LocalDate fechaCreacion;

    @Size(max = 50)
    @ColumnDefault("'Pendiente'")
    @Column(name = "estado", length = 50)
    private String estado;

    @ColumnDefault("0.00")
    @Column(name = "precio_total", precision = 10, scale = 2)
    private BigDecimal precioTotal;

    @ManyToOne(fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "vehiculo_id")
    private Vehiculo vehiculo;

}