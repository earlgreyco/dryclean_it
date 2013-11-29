FactoryGirl.define do
	factory :user do
		name "Elon Musk"
		email "elon@tesla.com"
		password "model123"
		password_confirmation "model123"
	end
end