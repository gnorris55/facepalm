User.destroy_all

@u1 = User.create(email: ENV["ADMIN_EMAIL"], username: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"])
@u2 = User.create(email: "gmanthefan123@gmail.com", username: "bob_the_man", password: "password123")
@u3 = User.create(email: "evannorris99@gmail.com", username: "scributals", password: "some_password")

@u1.posts.new(body: "this is facepalm's first post").save
@u2.posts.new(body: "I like cookies").save
@u2.posts.new(body: "game of thrones season 8 sucked").save
@u1.posts.new(body: "did you hear what elon musk did").save
@u3.posts.new(body: "I can't stand quarantine").save
@u2.posts.new(body: "MY EYES, THEY BURRRN").save
@u3.posts.new(body: "hello everybody welcome to my youtube channel").save

p "#{User.count} users created"
p "#{Post.count} posts created"

