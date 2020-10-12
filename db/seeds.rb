require 'ffaker'
PASSWORD = 123456

10.times do
  company_id = Company.all.sample.id
  user = User.new(
    name: FFaker::Name.name,
    email: FFaker::InternetSE.email,
    password: PASSWORD,
    password_confirmation: PASSWORD,
    company_id: company_id
  )
  user.save!
end

30.times do
    user_id = User.all.sample.id
    post = Post.new(
      title: FFaker::Lorem.phrase,
      body: FFaker::Lorem.paragraph,
      user_id: user_id
    )
    post.save!
end


