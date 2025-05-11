package com.harel.cookle.entities;

import jakarta.persistence.*;

/**
 * Entity class representing an ingredient in the database.
 * Maps to the INGRIDIENTS table in the database.
 */
@Entity
@Table(name = "INGRIDIENTS")
public class Ingredient {
    /**
     * Unique identifier for the ingredient
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;
    
    /**
     * Name of the ingredient
     */
    @Column(name = "NAME", nullable = false)
    private String name;
    
    /**
     * Amount of the ingredient in grams
     */
    @Column(name = "AMOUNT")
    private Integer amount;

    /**
     * @return The ingredient's unique identifier
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
     * @return The ingredient's name
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
     * @return The amount of the ingredient in grams
     */
    public Integer getAmount() {
        return amount;
    }

    /**
     * @param amount The amount to set
     */
    public void setAmount(Integer amount) {
        this.amount = amount;
    }
    
}
