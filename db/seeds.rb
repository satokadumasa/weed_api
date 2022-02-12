# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User
User.create(email: 'webmaster@example.com', password: 'password')
User.create(email: 'user01@example.com', password: 'password')
User.create(email: 'user02@example.com', password: 'password')
User.create(email: 'user03@example.com', password: 'password')
User.create(email: 'user04@example.com', password: 'password')
# Book
Book.create(user_id: 2, title:'宇宙の戦士', detail: '宇宙の戦士\n宇宙の戦士\n宇宙の戦士\n宇宙の戦士')
Book.create(user_id: 2, title:'星を継ぐもの', detail: '星を継ぐもの\n星を継ぐもの\n星を継ぐもの\n星を継ぐもの')
Book.create(user_id: 2, title:'ガニメデの優しい巨人', detail: 'ガニメデの優しい巨人\nガニメデの優しい巨人\nガニメデの優しい巨人\nガニメデの優しい巨人')
