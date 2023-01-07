require 'recipe_repository'
require 'recipe'

RSpec.describe 'RecipeRepository' do

def reset_recipe_table
  seed_sql = File.read('spec/seeds_recipe.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipe_table
  end

  it 'returns all the recipes' do
    recipes = RecipeRepository.new
    expect(recipes.all.length).to eq 3
    expect(recipes.all.first.id).to eq '1'
    expect(recipes.all.first.name).to eq 'Mozzarella and Basil Pizza'
    expect(recipes.all.first.cooking_time).to eq '45'
    expect(recipes.all.first.rating).to eq '5'
  end

  it 'finds the first recipe by id' do
    repo = RecipeRepository.new
    find_recipe = repo.find('1')
    expect(find_recipe.name).to eq 'Mozzarella and Basil Pizza'
    expect(find_recipe.cooking_time).to eq '45'
    expect(find_recipe.rating).to eq '5'
  end

  it 'finds the second recipe by id' do
    repo = RecipeRepository.new
    find_recipe = repo.find('2')
    expect(find_recipe.id).to eq '2'
    expect(find_recipe.name).to eq 'Spicy Roasted Parsnip Soup'
    expect(find_recipe.cooking_time).to eq '35'
    expect(find_recipe.rating).to eq '5'
  end
  
end
end