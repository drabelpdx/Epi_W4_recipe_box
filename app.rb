require('bundler/setup')
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @categories = Category.all()
  erb(:index)
end

get('/categories/:id') do
  @category = Category.find(params.fetch("id"))
  erb(:categories)
end

patch('/categories/:id') do
  @category = Category.find(params.fetch("id"))
  name = params.fetch('name')
  @category.update(:name => name)
  erb(:categories)
end

delete('/categories/:id') do
  @category = Category.find(params.fetch("id"))
  @category.delete()
  @categories = Category.all()
  erb(:index)
end

post('/category_add') do
  name = params.fetch('name')
  Category.create({:name => name})
  @categories = Category.all()
  erb(:index)
end

get('/recipe_add') do
  @recipes = Recipe.all()
  @categories = Category.all()
  erb(:recipe_form)
end

post('/recipe_add') do
  name = params.fetch('name')
  ingredients = params.fetch('ingredients')
  instructions = params.fetch('instructions')
  category = params.fetch('category')
  rating = params.fetch('rating')

  @recipes = Recipe.all()
  @categories = Category.all()
  @recipe = Recipe.new({:name => name, :ingredients => ingredients, :instructions => instructions, :rating => rating})

  if @recipe.save
    erb(:index)
  else
    erb(:errors)
  end
end


get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  erb(:recipe)
end

patch('/recipe/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  name = params.fetch('name')
  ingredients = params.fetch('ingredients')
  instructions = params.fetch('instructions')
  category = params.fetch('category')
  rating = params.fetch('rating')
  @recipe.update({:name => name, :ingredients => ingredients, :instructions => instructions, :rating => rating})
  @recipes = Recipe.all()
  erb(:recipe_form)
end

delete('/recipe/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  @recipe.delete()
  @recipes = Recipe.all
  erb(:recipe_form)
end
