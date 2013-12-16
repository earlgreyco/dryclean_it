require 'spec_helper'

describe Step do  
  let!(:admin) 	{ FactoryGirl.create(:admin) }
  let!(:user) 	{ FactoryGirl.create(:user) }
  let!(:recipe) { FactoryGirl.create(:recipe) }
  let!(:step) 	{ FactoryGirl.create(:step) }

  subject { step }

  it { should respond_to(:description) } 
  it { should respond_to(:recipe_id) }

  it { should be_valid }

  describe "when recipe_id is not present" do
  	before { step.recipe_id = nil }
  	it { should_not be_valid }
  end

  describe "with blank description" do
  	before { step.description = " " }
  	it { should_not be_valid }
  end
end
