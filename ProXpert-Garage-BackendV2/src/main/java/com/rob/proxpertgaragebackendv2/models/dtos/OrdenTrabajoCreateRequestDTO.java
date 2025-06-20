package com.rob.proxpertgaragebackendv2.models.dtos;

import jakarta.validation.constraints.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrdenTrabajoCreateRequestDTO {

    @NotNull
    @Size(min = 3, max = 100, message = "El nombre del cliente debe tener entre 3 y 100 caracteres")
    private String cliente;

    @NotNull
    @Size(min = 3, max = 100, message = "El nombre del vehículo debe tener entre 3 y 100 caracteres")
    private String vehiculo;

    @NotNull
    @Pattern(regexp = "^[A-Z0-9]{7}$", message = "La matrícula debe tener exactamente 7 caracteres alfanuméricos")
    private String matricula;

    @NotNull
    @FutureOrPresent
    private LocalDate fechaInicio;

    @FutureOrPresent
    private LocalDate fechaFin;

    @NotNull
    @Size(min = 3, max = 10, message = "Los estados deben tener entre 3 y 10 caracteres")
    private String estado;

    @NotNull
    @DecimalMin(value = "0.0", inclusive = true, message = "El precio total no puede ser negativo")
    private BigDecimal precioTotal;
}

