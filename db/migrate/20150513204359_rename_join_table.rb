class RenameJoinTable < ActiveRecord::Migration
  def change
    rename_column(:categories_recipes, :categories_id, :category_id)
    rename_column(:categories_recipes, :recipes_id, :recipe_id)
  end
end
