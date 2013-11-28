require 'spec_helper'

describe "Static pages" do
  
  subject { page }

	let(:base_title) { "ProblemPop" }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('ProblemPop') }
  	it { should have_title("#{base_title}")}
  end

  describe "About page" do
    before { visit about_path }

    it { should have_title("#{base_title} | About Us") }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_title("#{base_title} | Contact Us") }
  end
end
