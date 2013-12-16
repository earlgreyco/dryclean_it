FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :recipe do
  	sequence(:title)       { |n| "Recipe #{n}" }
  	sequence(:description) { |n| "This is recipe #{n}" }

  	user
  end

  factory :ingredient do
    sequence(:title)    { |n| "Ingredient #{n}" }
    sequence(:quantity) { |n| 5 }

    recipe
  end

  factory :step do
    sequence(:description) { |n| "This is step #{n}" }

    recipe
  end
end