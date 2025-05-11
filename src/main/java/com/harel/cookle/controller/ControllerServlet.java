package com.harel.cookle.controller;

import com.harel.cookle.entities.Recipe;
import com.harel.cookle.services.RecipeService;
import com.harel.cookle.dto.RecipeIngredientsDTO;
import com.harel.cookle.dto.RecipeInstructionsDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * REST controller that handles recipe-related API requests.
 * Provides endpoints for retrieving recipes and their ingredients.
 */
@RestController
@RequestMapping("/ControllerServlet")
public class ControllerServlet {   
   
    private final RecipeService recipeService;

    /**
     * Constructor that injects the RecipeService dependency.
     * 
     * @param recipeService Service for handling recipe data operations
     */
    @Autowired
    public ControllerServlet(RecipeService recipeService) {
        this.recipeService = recipeService;
    }

    /**
     * Retrieves all recipes in the system.
     * 
     * @return HTTP response containing a list of all recipes
     */
    @GetMapping("/recipes")
    public ResponseEntity<List<Recipe>> getAllRecipes() {
        return ResponseEntity.ok(recipeService.getAllRecipes());
    }

    /**
     * Retrieves a specific recipe by its ID.
     * 
     * @param id The unique identifier of the recipe
     * @return HTTP response containing the recipe if found, or 404 Not Found
     */
    @GetMapping("/recipes/{id}")
    public ResponseEntity<Recipe> getRecipeById(@PathVariable Long id) {
        return recipeService.getRecipeById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    /**
     * Retrieves ingredients for a specific recipe by its ID.
     * 
     * @param id The unique identifier of the recipe
     * @return HTTP response containing the recipe ingredients if found, or 404 Not Found
     */
    @GetMapping("/recipes/{id}/ingredients")
    public ResponseEntity<List<RecipeIngredientsDTO>> getRecipeIngredientsById(@PathVariable Long id) {
        List<RecipeIngredientsDTO> recipeIngredients = recipeService.getIngredientsDiscriptionByRecipeId(id.toString());
        if (recipeIngredients != null && !recipeIngredients.isEmpty()) {
            return ResponseEntity.ok(recipeIngredients);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * Searches for recipes by name and returns their ingredients.
     * 
     * @param name The name of the recipe to search for
     * @return HTTP response containing matching recipes and their ingredients, or 404 Not Found
     */
    @GetMapping("/recipes/name/{name}")
    public ResponseEntity<List<RecipeIngredientsDTO>> getRecipeIngredientsByName(@PathVariable String name) {
        List<RecipeIngredientsDTO> recipeIngredients = recipeService.getIngredientsDiscriptionByRecipename(name);
        if (recipeIngredients != null && !recipeIngredients.isEmpty()) {
            return ResponseEntity.ok(recipeIngredients);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * Retrieves instructions for a specific recipe by its ID.
     * 
     * @param id The unique identifier of the recipe
     * @return HTTP response containing the recipe instructions if found, or 404 Not Found
     */
    @GetMapping("/recipes/{id}/instructions")
    public ResponseEntity<List<RecipeInstructionsDTO>> getRecipeInstructionsById(@PathVariable Long id) {
        List<RecipeInstructionsDTO> recipeInstructions = recipeService.getInstructionsDescriptionByRecipeId(id.toString());
        if (recipeInstructions != null && !recipeInstructions.isEmpty()) {
            return ResponseEntity.ok(recipeInstructions);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

}
