# Recipes Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `recipes`*

```
# EXAMPLE

Table: recipes

Columns:
id | name | cooking_time |  rating
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{recipes}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (id, name, cooking_time, rating) VALUES ('1', 'Mozzarella and Basil Pizza', '45', '5');
INSERT INTO recipes (id, name, cooking_time, rating) VALUES ('2', 'Spicy Roasted Parsnip Soup', '35', '5');
INSERT INTO recipes (id, name, cooking_time, rating) VALUES ('3', 'Winter Pulse Broth', '55', '3');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 recipes_directory < seeds_{recipes}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: recipes

# Model class
# (in lib/recipe.rb)
class Recipe
end

# Repository class
# (in lib/recipe_repository.rb)
class RecipeRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: recipes

# Model class
# (in lib/recipe.rb)

class Recipe

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :ccooking_time, :rating
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# recipe = Recipe.new
# recipe.name = 'pizza'
# recipe.name
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: recipes

# Repository class
# (in lib/recipe_repository.rb)

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cooking_time, rating FROM recipes;

    # Returns an array of Recipe objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;

    # Returns a single Recipe object.
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(recipe)
  # end

  # def update(recipe)
  # end

  # def delete(recipe)
  # end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all recipes

repo = RecipeRepository.new

recipes = repo.all

recipes.length # =>  3

recipes[0].id # =>  1
recipes[0].name # =>  'Mozzarella and Basil Pizza'
recipes[0].cooking_time# =>  '45'
recipes[0].rating #=> '5'

recipes[1].id # =>  2
recipes[1].name # =>  'Spicy Roasted Parsnip Soup'
recipes[1].cooking_time # =>  '35'
recipes[1].rating #=> '5'

recipes[2].id # =>  3
recipes[2].name # =>  'Winter Pulse Broth'
recipes[2].cooking_time # =>  '55'
recipes[2].rating #=> '3'


# 2
# Get a single recipe

repo = RecipeRepository.new

recipe = repo.find(1)
recipe.id # =>  1
recipe.name # =>  'Mozzarella and Basil Pizza'
recipe.cooking_time# =>  '45'
recipe.rating #=> '5'


# Add more examples for each method
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/recipe_repository_spec.rb

def reset_recipe_table
  seed_sql = File.read('spec/seeds_recipe.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipe_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->