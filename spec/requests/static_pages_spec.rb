require 'spec_helper'

describe "Static pages" do
  
	let(:base_title) { "ProblemPop" }

  describe "Home page" do

  	it "should have the content 'ProblemPop'" do
  		visit root_path
  		expect(page).to have_content('ProblemPop')
  	end

  	it "should have the title 'ProblemPop'" do
  		visit root_path
  		expect(page).to have_title("#{base_title}")
  	end
  end

  describe "About page" do

  	it "should have the title 'ProblemPop | About Us'" do
			visit '/about'
			expect(page).to have_title("#{base_title} | About Us")
  	end
  end

  describe "Contact page" do

  	it "should have the title 'ProblemPop | Contact Us'" do
  		visit '/contact'
  		expect(page).to have_title("#{base_title} | Contact Us")
  	end
  end
end
