package com.harel.cookle.repositories;

import com.harel.cookle.entities.Recipe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repository interface for Recipe entities.
 * Provides database access methods and custom queries for recipe data.
 */
@Repository
public interface RecipeRepository extends JpaRepository<Recipe, Long> {

    /**
     * Finds recipes that contain at least one of the requested ingredients.
     * 
     * @param ingredientIds List of ingredient IDs to search for
     * @return List of recipes containing any of the specified ingredients
     */
    @Query(value = "SELECT DISTINCT r.* FROM \"RECIPES\" r " +
           "JOIN \"RECIPES_INGRIDIENTS\" ri ON r.\"ID\" = ri.\"RECIPE_ID\" " +
           "JOIN \"INGRIDIENTS\" i ON ri.\"INGREDIENT_ID\" = i.\"ID\" " +
           "WHERE i.\"ID\" IN :ingredientIds", 
           nativeQuery = true)
    List<Recipe> findRecipesWithAnyIngredients(@Param("ingredientIds") List<Long> ingredientIds);

    /**
     * Finds recipes whose names contain a specific word or phrase.
     * 
     * @param recipeName The word or phrase to search for in recipe names
     * @return List of recipes with matching names
     */
    @Query(value = "SELECT DISTINCT r.* FROM \"RECIPES\" r WHERE LOWER(r.\"NAME\") LIKE LOWER(CONCAT('%', :recipeName, '%'))", 
           nativeQuery = true)
    List<Recipe> findRecipesByName(@Param("recipeName") String recipeName);

    /**
     * Retrieves ingredients description for a specific recipe by ID.
     * Returns a formatted string of ingredients with their amounts.
     * 
     * @param recipeId The ID of the recipe to get ingredients for
     * @return List of DTOs containing recipe name and formatted ingredients
     */
    @Query(value = "SELECT r.\"ID\" AS recipeId, r.\"NAME\" AS recipe, STRING_AGG(i.\"NAME\" || ' (' || i.\"AMOUNT\" || ' grams)', ', ') AS ingredients " +
               "FROM \"RECIPES_INGRIDIENTS\" ri " +
               "INNER JOIN \"INGRIDIENTS\" i ON i.\"ID\" = ri.\"INGREDIENT_ID\" " +
               "INNER JOIN \"RECIPES\" r ON r.\"ID\" = ri.\"RECIPE_ID\" " +
               "WHERE ri.\"RECIPE_ID\" = CAST(:recipeId AS bigint) " +
               "GROUP BY r.\"ID\", r.\"NAME\"", 
       nativeQuery = true)
    List<com.harel.cookle.dto.RecipeIngredientsDTO> getIngredientsDiscriptionByRecipeId(@Param("recipeId") String recipeId);

    /**
     * Searches for recipes by name and retrieves their ingredients.
     * Returns a formatted string of ingredients with their amounts.
     * 
     * @param recipeName The name to search for in recipe titles
     * @return List of DTOs containing matching recipes and formatted ingredients
     */
    @Query(value = "SELECT r.\"ID\" AS recipeId, r.\"NAME\" AS recipe, STRING_AGG(i.\"NAME\" || ' (' || i.\"AMOUNT\" || ' grams)', ', ') AS ingredients " +
    "FROM \"RECIPES_INGRIDIENTS\" ri " +
    "INNER JOIN \"INGRIDIENTS\" i ON i.\"ID\" = ri.\"INGREDIENT_ID\" " +
    "INNER JOIN \"RECIPES\" r ON r.\"ID\" = ri.\"RECIPE_ID\" " +
    "WHERE LOWER(r.\"NAME\") LIKE LOWER(CONCAT('%', :recipeName, '%')) " +
    "GROUP BY r.\"ID\", r.\"NAME\"", 
    nativeQuery = true)
    List<com.harel.cookle.dto.RecipeIngredientsDTO> getIngredientsDiscriptionByRecipename(@Param("recipeName") String recipeName);

    /**
     * Retrieves instructions description for a specific recipe by ID.
     * Returns a formatted string of instructions.
     * 
     * @param recipeId The ID of the recipe to get instructions for
     * @return List of DTOs containing recipe name and formatted instructions
     */
    @Query(value = "SELECT r.\"NAME\" AS recipe, STRING_AGG(ri.\"DESCRIPTION\", '\n') AS instructions " +
    "FROM \"RECIPES_INSTRUCTIONS\" ri " +
    "INNER JOIN \"RECIPES\" r ON r.\"ID\" = ri.\"RECIPE_ID\" " +
    "WHERE ri.\"RECIPE_ID\" = CAST(:recipeId AS bigint) " +
    "GROUP BY r.\"ID\", r.\"NAME\"", 
    nativeQuery = true)
    List<com.harel.cookle.dto.RecipeInstructionsDTO> getInstructionsDescriptionByRecipeId(@Param("recipeId") String recipeId);
}
