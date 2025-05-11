package com.harel.cookle.dto;

import lombok.Data;

@Data
public class InstructionDTO {
    
    private Long id;
    private Long recipeId;
    private String description;
}
