package com.harel.cookle.dto;

import java.util.List;

import lombok.Data;

@Data
public class RecipeDTO {
    private Long id;
    private String name;
    private Integer yield;
    private List<String> instructions;
    private List<IngredientDto> ingredients;
} 