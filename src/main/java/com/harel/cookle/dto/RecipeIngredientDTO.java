package com.harel.cookle.dto;

import lombok.Data;

@Data
public class RecipeIngredientDTO {
    
    private Long id;
    private Long recipeId;
    private Long ingredientId;
    private String ingredientName;
    
    
}
