/**
 * Recipe search JavaScript functionality
 * Handles user search form submission and displaying search results
 */
document.addEventListener('DOMContentLoaded', function() {
    // Get DOM elements
    const searchForm = document.getElementById('search-form');
    const searchInput = document.getElementById('search-input');
    const resultsContainer = document.getElementById('results-container');
    const loadingIndicator = document.getElementById('loading');
    const errorMessage = document.getElementById('error-message');
    const singleRecipeContainer = document.getElementById('single-recipe-container');
    const backButton = document.getElementById('back-button');
    const recipeTitle = document.getElementById('recipe-title');
    const recipeIngredients = document.getElementById('recipe-ingredients');
    const recipeInstructions = document.getElementById('recipe-instructions');
    
    let currentRecipes = []; // Store current search results

    /**
     * Handle form submission for recipe search
     * Prevents default behavior, validates input, and fetches search results
     */
    searchForm.addEventListener('submit', function(e) {
        e.preventDefault();
        const searchTerm = searchInput.value.trim();
        
        // Return early if search term is empty
        if (!searchTerm) {
            return;
        }

        // Show loading indicator and hide other elements
        loadingIndicator.style.display = 'block';
        resultsContainer.style.display = 'none';
        singleRecipeContainer.style.display = 'none';
        errorMessage.style.display = 'none';

        // Make API call to search recipes by name
        fetch(`/ControllerServlet/recipes/name/${encodeURIComponent(searchTerm)}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Recipe not found');
                }
                return response.json();
            })
            .then(data => {
                // Hide loading indicator
                loadingIndicator.style.display = 'none';
                
                if (data && data.length > 0) {
                    // Store current recipes
                    currentRecipes = data;
                    // Display results
                    displayResults(data);
                } else {
                    throw new Error('No recipes found matching your search');
                }
            })
            .catch(error => {
                // Hide loading indicator and show error
                loadingIndicator.style.display = 'none';
                errorMessage.textContent = error.message;
                errorMessage.style.display = 'block';
            });
    });

    /**
     * Handle back button click to return to search results
     */
    backButton.addEventListener('click', function() {
        singleRecipeContainer.style.display = 'none';
        resultsContainer.style.display = 'block';
    });

    /**
     * Displays search results on the page
     * 
     * @param {Array} recipes - Array of recipe objects with recipe and ingredients properties
     */
    function displayResults(recipes) {
        // Clear previous results
        resultsContainer.innerHTML = '';
        
        // Create result elements for each recipe
        recipes.forEach((recipe, index) => {
            // Create container for this recipe result
            const recipeElement = document.createElement('div');
            recipeElement.className = 'recipe-result';
            
            // Create and populate recipe title element
            const titleElement = document.createElement('div');
            titleElement.className = 'recipe-title';
            titleElement.textContent = recipe.recipe;
            titleElement.dataset.index = index;
            
            // Add click event to show single recipe
            titleElement.addEventListener('click', function() {
                showSingleRecipe(parseInt(this.dataset.index));
            });
            
            // Create and populate ingredients element
            const ingredientsElement = document.createElement('div');
            ingredientsElement.className = 'recipe-ingredients';
            ingredientsElement.textContent = recipe.ingredients;
            
            // Add elements to the DOM
            recipeElement.appendChild(titleElement);
            recipeElement.appendChild(ingredientsElement);
            resultsContainer.appendChild(recipeElement);
        });
        
        // Show results container
        resultsContainer.style.display = 'block';
    }

    /**
     * Shows a single recipe with ingredients and instructions
     * 
     * @param {number} index - Index of the selected recipe in the currentRecipes array
     */
    function showSingleRecipe(index) {
        const recipe = currentRecipes[index];
        if (!recipe) return;

        // Set recipe title and ingredients
        recipeTitle.textContent = recipe.recipe;
        recipeIngredients.textContent = recipe.ingredients;
        
        // Clear previous instructions
        recipeInstructions.textContent = 'Loading instructions...';
        
        // Use the actual recipe ID from the data
        const recipeId = recipe.recipeId;
        
        // Fetch instructions for this recipe
        fetch(`/ControllerServlet/recipes/${recipeId}/instructions`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Instructions not found');
                }
                return response.json();
            })
            .then(data => {
                if (data && data.length > 0) {
                    // Display instructions
                    recipeInstructions.textContent = data[0].instructions || 'No instructions available.';
                } else {
                    recipeInstructions.textContent = 'No instructions available for this recipe.';
                }
            })
            .catch(error => {
                recipeInstructions.textContent = 'Could not load instructions. Please try again later.';
                console.error('Error fetching instructions:', error);
            });
        
        // Hide results and show single recipe
        resultsContainer.style.display = 'none';
        singleRecipeContainer.style.display = 'block';
    }
}); 