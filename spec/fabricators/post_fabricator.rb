Fabricator :post do

  title { sequence(:title) { |n| "My #{n}st Post" } }
  body  { sequence(:body)  { |n| "omg this is like my favoirte party i can like type and do things and then omg blah blah blah blah blah #{n}" } }
  type  "post"
  category "tests"

end
