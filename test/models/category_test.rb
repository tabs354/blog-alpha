require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "sports")
  end

  test "Category should be valid" do
    assert @category.valid?
  end

  test "Name Should Be Present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "Name Should Be Unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "Name Should Not Be Too Long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "Name Should Not Be Too Short" do
    @category.name = "aa"
    assert_not @category.valid?
  end

  test "Name should be email type" do

  end
end