require 'spec_helper'

describe Recipe do
	let!(:admin) 	{ FactoryGirl.create(:admin) }
	let!(:user) 	{ FactoryGirl.create(:user) }
	let!(:recipe) { FactoryGirl.create(:recipe) }

	subject { recipe }

	it { should respond_to(:title) }
	it { should respond_to(:description) }
	it { should respond_to(:user_id) }

	it { should be_valid }

	describe "when user_id is not present" do
		before { recipe.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank title" do
		before { recipe.title = " " }
		it { should_not be_valid }
	end
end