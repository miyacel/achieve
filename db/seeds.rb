100.times do |n|
    email = Faker::Internet.email
    name = Faker::Name.name
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 )
end

n = 1
n = 0
while n <= 100
  Blog.create(
      title: "スーパーボウル",
      content: "1年に一度。アメリカ一を競うカップ！！",
      user_id: rand(100) + 1
      )
  n += 1
end
