package com.harel.cookle.dto;

import java.util.List;

public class RecipeSearchRequestDTO {
    private List<Long> ingredientIds;
    private boolean matchAllIngredients;

    public RecipeSearchRequestDTO() {
    }

    public RecipeSearchRequestDTO(List<Long> ingredientIds, boolean matchAllIngredients) {
        this.ingredientIds = ingredientIds;
        this.matchAllIngredients = matchAllIngredients;
    }

    public List<Long> getIngredientIds() {
        return ingredientIds;
    }

    public void setIngredientIds(List<Long> ingredientIds) {
        this.ingredientIds = ingredientIds;
    }

    public boolean isMatchAllIngredients() {
        return matchAllIngredients;
    }

    public void setMatchAllIngredients(boolean matchAllIngredients) {
        this.matchAllIngredients = matchAllIngredients;
    }
} 