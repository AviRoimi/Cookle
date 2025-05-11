package com.harel.cookle.entities;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Entity class representing a recipe in the database.
 * Maps to the RECIPES table in the database.
 */
@Entity
@Table(name = "RECIPES")
@Data
public class Recipe {
    /**
     * Unique identifier for the recipe
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    /**
     * Name of the recipe
     */
    @Column(name = "NAME", nullable = false)
    private String name;

    /**
     * Number of servings the recipe yields
     */
    @Column(name = "YIELD")
    private Integer yield;

    /**
     * @return The recipe's unique identifier
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id The identifier to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return The recipe's name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name The name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return The recipe's yield (number of servings)
     */
    public Integer getYield() {
        return yield;
    }

    /**
     * @param yield The yield to set
     */
    public void setYield(Integer yield) {
        this.yield = yield;
    }
}
