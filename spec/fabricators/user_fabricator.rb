Fabricator :user do

  name  { sequence(:name ) { |n| "Test User-#{n}" } }
  email { sequence(:email) { |n| "user#{n}@example.com" } }
  password "please"

end
