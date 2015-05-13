class Category < ActiveRecord::Base
  has_and_belongs_to_many(:recipe)

  validates(:name, {:presence => true})
end
