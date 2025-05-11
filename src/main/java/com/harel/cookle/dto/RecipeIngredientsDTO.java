package com.harel.cookle.dto;

/**
 * Data Transfer Object for representing a recipe with its ingredients.
 * Used to transfer recipe data from the database to the frontend.
 */
public class RecipeIngredientsDTO {
    /**
     * The ID of the recipe
     */
    private Long recipeId;
    
    /**
     * The name of the recipe
     */
    private String recipe;
    
    /**
     * Formatted string of ingredients and their amounts
     */
    private String ingredients;

    /**
     * Default constructor
     */
    public RecipeIngredientsDTO() {
    }

    /**
     * Constructor with all fields
     * 
     * @param recipeId The ID of the recipe
     * @param recipe The name of the recipe
     * @param ingredients Formatted string of ingredients and their amounts
     */
    public RecipeIngredientsDTO(Long recipeId, String recipe, String ingredients) {
        this.recipeId = recipeId;
        this.recipe = recipe;
        this.ingredients = ingredients;
    }

    /**
     * @return The recipe ID
     */
    public Long getRecipeId() {
        return recipeId;
    }

    /**
     * @param recipeId The recipe ID to set
     */
    public void setRecipeId(Long recipeId) {
        this.recipeId = recipeId;
    }

    /**
     * @return The recipe name
     */
    public String getRecipe() {
        return recipe;
    }

    /**
     * @param recipe The recipe name to set
     */
    public void setRecipe(String recipe) {
        this.recipe = recipe;
    }

    /**
     * @return The formatted ingredients string
     */
    public String getIngredients() {
        return ingredients;
    }

    /**
     * @param ingredients The ingredients string to set
     */
    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }
} 