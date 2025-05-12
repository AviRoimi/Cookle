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
    const searchContainer = document.querySelector('.search-container');
    
    // Set initial state with search in center
    searchContainer.classList.add('initial-state');
    
    // Hide the single recipe container on page load
    singleRecipeContainer.style.display = 'none';
    
    // Function to update container margins based on search container height
    function updateContainerMargins() {
        const searchHeight = searchContainer.offsetHeight;
        const topMargin = searchHeight + 20; // Add some extra space
        
        // Apply to both results and single recipe containers
        document.documentElement.style.setProperty('--container-top-margin', topMargin + 'px');
        
        // Update inline margins if containers are visible
        if (resultsContainer.style.display === 'flex') {
            resultsContainer.style.marginTop = topMargin + 'px';
        }
        
        if (singleRecipeContainer.style.display === 'block') {
            singleRecipeContainer.style.marginTop = topMargin + 'px';
        }
    }
    
    // Update margins when window is resized
    window.addEventListener('resize', updateContainerMargins);
    
    // Initial update of margins
    setTimeout(updateContainerMargins, 100);
    
    // Helper function to set container class and ensure proper display
    function setContainerClass(container, className, displayStyle) {
        // First remove all possible classes
        if (container === resultsContainer) {
            container.classList.remove('results-container-empty', 'results-container-with-results', 'results-container-many-results');
            
            // If setting to empty, make sure it's completely hidden
            if (className === 'results-container-empty') {
                container.style.display = 'none';
                container.style.visibility = 'hidden';
                return;
            }
        } else if (container === singleRecipeContainer) {
            container.classList.remove('single-recipe-container-compact', 'single-recipe-container-expanded');
        }
        
        // Add the new class
        container.classList.add(className);
        
        // Set display style
        container.style.display = displayStyle;
        container.style.visibility = 'visible';
        
        // Update container margins after display style changes
        updateContainerMargins();
    }
    
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

        // Move search bar to top if it's in initial state
        searchContainer.classList.remove('initial-state');
        
        // Reset container class to empty state
        setContainerClass(resultsContainer, 'results-container-empty', 'none');
        setContainerClass(singleRecipeContainer, 'single-recipe-container-compact', 'none');
        errorMessage.style.display = 'none';

        // Show loading indicator and hide other elements
        loadingIndicator.style.display = 'block';
        
        // Update margins after layout changes
        setTimeout(updateContainerMargins, 100);

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
        // Hide single recipe view and show results
        setContainerClass(singleRecipeContainer, 'single-recipe-container-compact', 'none');
        
        // Show results with the appropriate class
        if (currentRecipes.length > 10) {
            setContainerClass(resultsContainer, 'results-container-many-results', 'flex');
        } else {
            setContainerClass(resultsContainer, 'results-container-with-results', 'flex');
        }
    });

    /**
     * Displays search results on the page
     * 
     * @param {Array} recipes - Array of recipe objects with recipe and ingredients properties
     */
    function displayResults(recipes) {
        // Check if recipes array is empty or undefined
        if (!recipes || recipes.length === 0) {
            setContainerClass(resultsContainer, 'results-container-empty', 'none');
            resultsContainer.style.display = 'none';
            resultsContainer.style.visibility = 'hidden';
            return;
        }
        
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
        
        // Apply the appropriate class based on number of results
        if (recipes.length > 10) {
            setContainerClass(resultsContainer, 'results-container-many-results', 'flex');
        } else {
            setContainerClass(resultsContainer, 'results-container-with-results', 'flex');
        }
        
        // Scroll to the top of results
        resultsContainer.scrollTop = 0;
    }

    /**
     * Shows a single recipe with ingredients and instructions
     * 
     * @param {number} index - Index of the selected recipe in the currentRecipes array
     */
    function showSingleRecipe(index) {
        const recipe = currentRecipes[index];
        if (!recipe) {
            setContainerClass(singleRecipeContainer, 'single-recipe-container-compact', 'none');
            return;
        }

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
                    
                    // Check instruction length and apply appropriate class
                    if (data[0].instructions && data[0].instructions.length > 500) {
                        setContainerClass(singleRecipeContainer, 'single-recipe-container-expanded', 'block');
                    } else {
                        setContainerClass(singleRecipeContainer, 'single-recipe-container-compact', 'block');
                    }
                } else {
                    recipeInstructions.textContent = 'No instructions available for this recipe.';
                    setContainerClass(singleRecipeContainer, 'single-recipe-container-compact', 'block');
                }
            })
            .catch(error => {
                recipeInstructions.textContent = 'Could not load instructions. Please try again later.';
                console.error('Error fetching instructions:', error);
                setContainerClass(singleRecipeContainer, 'single-recipe-container-compact', 'block');
            });
        
        // Hide results and show single recipe
        setContainerClass(resultsContainer, 'results-container-empty', 'none');
        setContainerClass(singleRecipeContainer, 'single-recipe-container-compact', 'block');
        
        // Scroll to the top of the recipe
        singleRecipeContainer.scrollTop = 0;
    }
}); 