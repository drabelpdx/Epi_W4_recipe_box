class CreateJoinTable < ActiveRecord::Migration
  def change
    create_table(:categories_recipes) do |t|
    t.belongs_to(:categories)
    t.belongs_to(:recipes)
    end
  end
end
