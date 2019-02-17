package com.jaspreet.money.planner.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PasswordResetDTO {

    private String newPassword;
    private String confirmPassword;
    private String resetToken;

}
