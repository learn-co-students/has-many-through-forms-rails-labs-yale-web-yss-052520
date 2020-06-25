Post.destroy_all
Category.destroy_all
PostCategory.destroy_all
User.destroy_all
Comment.destroy_all


p1 = Post.create(title: "So Awesome", content: "Man am I a great blogger OR WHAT!")


c1 = Category.create(name: "Cool")

p1.categories << c1

p2 = Post.create(title: "Feeling Groovy", content: "I'm feeling so groovy")
u1 = User.create(username: 'CoolGuy5')
p2.comments.build(content: "Great Post!", user: u1)
p2.save