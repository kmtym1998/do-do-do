# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.delete_all
Category.delete_all
User.delete_all

User.create({password: "sample_pass", name: "sample_auth_user", sort_state: 0, is_admin: true})
User.create({password: "sample_pass", name: "sample_auth_user", sort_state: 0})
Category.create({title: "sample_category1", user_id: User.first.id})
Category.create({title: "sample_category2", user_id: User.first.id})
Task.create({title: "sample_task1", deadline: Time.current + 1.hour, user_id: User.first.id, category_id: Category.first.id})
Task.create({title: "sample_task2", deadline: Time.current + 1.hour, user_id: User.first.id, category_id: Category.first.id})