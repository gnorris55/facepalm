User.destroy_all

User.create(email: ENV["ADMIN_EMAIL"], username: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"])
User.create(email: "gmanthefan123@gmail.com", username: "bob_the_man", password: "password123")
User.create(email: "evannorris99@gmail.com", username: "scributals", password: "some_password")

User.first.posts.new(body: "this is facepalm's first post").save
User.second.posts.new(body: "I like cookies").save
User.second.posts.new(body: "game of thrones season 8 sucked").save
User.first.posts.new(body: "did you hear what elon musk did").save
User.third.posts.new(body: "I can stand quarantine").save
User.second.posts.new(body: "MY EYES, THEY BURRRN").save
User.third.posts.new(body: "hello everybody welcome to my youtube channel").save

p "#{User.count} users created"
p "#{Post.count} posts created"

