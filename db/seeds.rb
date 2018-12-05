User.create!(name: "Shyn Handsome",
    email: "thiennk52@wru.vn",
    password: "0912thien",
    password_confirmation: "0912thien", 
    admin: true,
    activated: true,
    activated_at: Time.zone.now)

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
      email: email,
      password: password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now)
end
