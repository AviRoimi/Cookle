# Cookle Recipe Data Loader

This folder contains SQL scripts to load sample recipe data into the Cookle application database.

## Files

- `import-all-data.sql` - **המלצה**: קובץ אחד המכיל את כל הנתונים - מרכיבים, מתכונים והוראות
- `load-recipes.sql` - Main script that loads all ingredients, recipes, and recipe-ingredient relations
- `load-instructions.sql` - Loads cooking instructions for recipes 1-10
- `load-instructions2.sql` - Loads cooking instructions for recipes 11-20

## How to Use

### Option 1: Using pgAdmin (הדרך המומלצת)

1. פתח את pgAdmin
2. התחבר לשרת PostgreSQL 
3. בחר את מסד הנתונים cookle
4. פתח את כלי השאילתה (Query Tool)
5. פתח את הקובץ `import-all-data.sql` ולחץ על כפתור Execute
6. כל הנתונים ייטענו בפעולה אחת

### Option 2: Using psql (requires PostgreSQL command line tools)

1. Make sure PostgreSQL is installed and running
2. Create the cookle database if it doesn't exist:
   ```
   createdb -U postgres cookle
   ```
3. Run the application at least once to create the tables (or run with `spring.jpa.hibernate.ddl-auto=create`)
4. Load the data using psql:
   ```
   psql -U postgres -d cookle -f import-all-data.sql
   ```
   או השתמש בקבצים הנפרדים:
   ```
   psql -U postgres -d cookle -f load-recipes.sql
   psql -U postgres -d cookle -f load-instructions.sql
   psql -U postgres -d cookle -f load-instructions2.sql
   ```

### Option 3: Using the DataImporter utility (Java)

1. Make sure the database exists and tables are created
2. Edit the DB connection details in `DataImporter.java` if needed (default: user=postgres, password=postgres)
3. Compile and run the DataImporter class:
   ```
   javac -cp .:path/to/jdbc.jar com/harel/cookle/util/DataImporter.java
   java -cp .:path/to/jdbc.jar com.harel.cookle.util.DataImporter
   ```
   Or simply run it from your IDE.

## Notes

- These scripts will clear existing data before loading the sample recipes
- The sample data includes 20 recipes with real-world ingredients and instructions
- Some recipes share common ingredients to demonstrate search functionality 