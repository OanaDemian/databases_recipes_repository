# Repository class
# (in lib/recipe_repository.rb)
require_relative 'recipe'
class RecipeRepository
   # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cooking_time, rating FROM recipes;
    sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])
    recipes = []
    result_set.map do |record|
      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.cooking_time = record['cooking_time']
      recipe.rating = record['rating']
      recipes << recipe
    end
    return recipes
    # Returns an array of Recipe objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    sql = 'SELECT id, name, cooking_time, rating FROM recipes WHERE id   = $1;' 
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    recipe = Recipe.new
    recipe.id = record ['id']
    recipe.name = record['name']
    recipe.cooking_time = record['cooking_time']
    recipe.rating = record['rating']
    return recipe
  end
end