# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all
Category.destroy_all

User.create(username:'asdkf', email:'dedn@gmail.com')
User.create(username:'asdkasfasdf', email:'daaaaaaa@gmail.com')
User.create(username:'asd cdckf', email:'cmmmn@gmail.com')
User.create(username:'asaweeeeeeeeeeedkf', email:'det@gmail.com')

Post.create(title: 'asdfkhasdf', content: 'aofoadka sdfkasd fjasd fkasdf kjasd f kj asdfkj asdkf jasdf')

Category.create(name: "French")
Category.create(name: "German")
Category.create(name: "English")