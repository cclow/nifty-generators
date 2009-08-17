Sham.username   { Faker::Internet.user_name }
Sham.email      { Faker::Internet.email }
Sham.password   { Faker::Lorem.sentence }

<%= user_class_name %>.blueprint do
  username      { Sham.username }
  email         { Sham.email }
  password      { Sham.password }
  password_confirmation   { password }
end