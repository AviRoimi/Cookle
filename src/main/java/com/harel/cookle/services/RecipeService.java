package com.harel.cookle.services;

import com.harel.cookle.entities.Recipe;
import com.harel.cookle.repositories.RecipeRepository;
import com.harel.cookle.dto.RecipeIngredientsDTO;
import com.harel.cookle.dto.RecipeInstructionsDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * Service class for handling recipe-related business logic.
 * Acts as an intermediary layer between controllers and repositories.
 */
@Service
public class RecipeService {

    private final RecipeRepository recipeRepository;

    /**
     * Constructor that injects the RecipeRepository dependency.
     * 
     * @param recipeRepository Repository for accessing recipe data
     */
    @Autowired
    public RecipeService(RecipeRepository recipeRepository) {
        this.recipeRepository = recipeRepository;
    }

    /**
     * Retrieves all recipes from the database.
     * 
     * @return List of all recipes
     */
    public List<Recipe> getAllRecipes() {
        return recipeRepository.findAll();
    }

    /**
     * Finds a recipe by its ID.
     * 
     * @param id The unique identifier of the recipe
     * @return Optional containing the recipe if found, or empty if not found
     */
    public Optional<Recipe> getRecipeById(Long id) {
        return recipeRepository.findById(id);
    }

    /**
     * Retrieves ingredients description for a specific recipe by ID.
     * 
     * @param recipeId The ID of the recipe as a string
     * @return List of DTO objects containing recipe name and ingredients
     */
    public List<RecipeIngredientsDTO> getIngredientsDiscriptionByRecipeId(String recipeId) {
        return recipeRepository.getIngredientsDiscriptionByRecipeId(recipeId);
    }

    /**
     * Searches for recipes by name and retrieves their ingredients.
     * 
     * @param recipeName The name to search for in recipe titles
     * @return List of DTO objects containing matching recipes and their ingredients
     */
    public List<RecipeIngredientsDTO> getIngredientsDiscriptionByRecipename(String recipeName) {
        return recipeRepository.getIngredientsDiscriptionByRecipename(recipeName);
    }

    /**
     * Retrieves instructions description for a specific recipe by ID.
     * 
     * @param recipeId The ID of the recipe as a string
     * @return List of DTO objects containing recipe name and instructions
     */
    public List<RecipeInstructionsDTO> getInstructionsDescriptionByRecipeId(String recipeId) {
        return recipeRepository.getInstructionsDescriptionByRecipeId(recipeId);
    }
} 