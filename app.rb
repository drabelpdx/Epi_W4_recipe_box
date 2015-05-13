require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @categories = Category.all()
  erb(:index)
end

get('/categories/:id') do
  @recipes = Recipe.all()
  @category = Category.find(params.fetch("id"))
  erb(:categories)
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
  Recipe.create({:name => name, :ingredients => ingredients, :instructions => instructions, :cat_id => category})
  @recipes = Recipe.all()
  @categories = Category.all()
  erb(:index)
end
