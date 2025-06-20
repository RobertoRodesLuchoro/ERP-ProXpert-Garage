package com.rob.proxpertgaragebackendv2.models.dtos;

import jakarta.validation.constraints.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PresupuestoCreateRequestDTO {

    @NotNull(message = "El ID del cliente es obligatorio")
    @Min(value = 0, message = "El ID del cliente no puede ser negativo")
    private Integer clienteId;

    @NotNull(message = "La fecha de creación es obligatoria")
    @PastOrPresent(message = "La fecha no puede ser futura")
    private LocalDate fechaCreacion;

    @NotNull(message = "El estado es obligatorio")
    @Size(min = 3, max = 50, message = "El estado debe tener entre 3 y 50 caracteres")
    private String estado;

    @NotNull(message = "El precio total es obligatorio")
    @DecimalMin(value = "0.0", inclusive = true, message = "El precio total no puede ser negativo")
    private BigDecimal precioTotal;
}

