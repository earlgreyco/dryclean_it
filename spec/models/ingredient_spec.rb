require 'spec_helper'

describe Ingredient do
  let!(:admin) 			{ FactoryGirl.create(:admin) }
	let!(:user) 			{ FactoryGirl.create(:user) }
	let!(:recipe) 		{ FactoryGirl.create(:recipe) }
	let!(:ingredient) { FactoryGirl.create(:ingredient) }

	subject { ingredient }

	it { should respond_to(:title) }
	it { should respond_to(:quantity) }
	it { should respond_to(:recipe_id) }

	it { should be_valid }

	describe "when recipe_id is not present" do
		before { ingredient.recipe_id = nil }
		it { should_not be_valid }
	end

	describe "with a blank title" do
		before { ingredient.title = " " }
		it { should_not be_valid }
	end

	describe "when quantity is not present" do
		before { ingredient.quantity = nil }
		it { should_not be_valid }
	end
end
