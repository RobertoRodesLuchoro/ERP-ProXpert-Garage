package com.rob.proxpertgaragebackendv2.models.dtos;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class LoginRequestDTO {

    @NotNull
    @Size(min = 3, max = 30, message = "El nombre de usuario o correo electrónico debe tener entre 3 y 30 caracteres.")
    private String usernameOrEmail;

    @NotNull
    @Pattern(regexp = "^(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).*$", message = "La contraseña debe contener al menos una letra mayúscula y un carácter especial.")
    @Size(min = 8, max = 30, message = "La contraseña debe tener entre 8 y 30 caracteres.")
    private String password;
}
