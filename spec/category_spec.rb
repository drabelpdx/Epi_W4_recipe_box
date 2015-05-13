require('spec_helper')

describe(Category) do
  it('validates presence of name') do
    category = Category.new({:name => ""})
    expect(category.save()).to(eq(false))
  end
end
