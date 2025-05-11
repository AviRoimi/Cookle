package com.harel.cookle.entities;

import jakarta.persistence.*;
import lombok.Data;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "RECIPES_INGRIDIENTS")
@Data
public class RecipeIngredient {
    
    @Embeddable
    public static class RecipeIngredientId implements Serializable {
        @Column(name = "RECIPE_ID")
        private Long recipeId;
        
        @Column(name = "INGREDIENT_ID")
        private Long ingredientId;
        
        public RecipeIngredientId() {
        }
        
        public RecipeIngredientId(Long recipeId, Long ingredientId) {
            this.recipeId = recipeId;
            this.ingredientId = ingredientId;
        }
        
        public Long getRecipeId() {
            return recipeId;
        }
        
        public void setRecipeId(Long recipeId) {
            this.recipeId = recipeId;
        }
        
        public Long getIngredientId() {
            return ingredientId;
        }
        
        public void setIngredientId(Long ingredientId) {
            this.ingredientId = ingredientId;
        }
        
        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            RecipeIngredientId that = (RecipeIngredientId) o;
            return Objects.equals(recipeId, that.recipeId) &&
                   Objects.equals(ingredientId, that.ingredientId);
        }
        
        @Override
        public int hashCode() {
            return Objects.hash(recipeId, ingredientId);
        }
    }
    
    @EmbeddedId
    private RecipeIngredientId id;
    
    @ManyToOne
    @MapsId("recipeId")
    @JoinColumn(name = "RECIPE_ID")
    private Recipe recipe;
    
    @ManyToOne
    @MapsId("ingredientId")
    @JoinColumn(name = "INGREDIENT_ID")
    private Ingredient ingredient;
    

    public RecipeIngredient() {
    }
    
    public RecipeIngredientId getId() {
        return id;
    }

    public void setId(RecipeIngredientId id) {
        this.id = id;   
    }

    public Recipe getRecipe() {
        return recipe;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
    }

    public Ingredient getIngredient() {
        return ingredient;
    }

    public void setIngredient(Ingredient ingredient) {
        this.ingredient = ingredient;
    }
    

}
