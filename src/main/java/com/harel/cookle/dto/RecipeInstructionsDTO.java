package com.harel.cookle.dto;

import lombok.Data;

/**
 * DTO for recipe instructions
 * Contains recipe name and instructions text
 */
@Data
public class RecipeInstructionsDTO {

    private String recipe;
    private String instructions;

    /**
     * Constructor with parameters exactly matching the query result columns
     * 
     * @param recipe Recipe name
     * @param instructions Recipe instructions text
     */
    public RecipeInstructionsDTO(String recipe, String instructions) {
        this.recipe = recipe;
        this.instructions = instructions;
    }
}
