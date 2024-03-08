# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

10.times { Movie.create(title: Faker::Movie.unique.title, overview: Faker::Movie.unique.quote, poster_url: "", rating: rand(1...10)) }

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
file2 = URI.open("https://st3.depositphotos.com/11433382/14401/i/600/depositphotos_144011201-stock-photo-popcorn-and-drinks-in-glasses.jpg")
file3 = URI.open("https://st2.depositphotos.com/1046535/7921/i/950/depositphotos_79216310-stock-photo-girl-eating-popcorn-in-cinema.jpg")

firstList = List.create(name: "Movies I dislike")
firstList.photo.attach(io: file, filename: "file1.png", content_type: "image/png")
firstList.save
secondList = List.create(name: "Movies I like")
secondList.photo.attach(io: file2, filename: "file2.png", content_type: "image/png")
secondList.save
thirdList = List.create(name: "Movies 2024")
thirdList.photo.attach(io: file3, filename: "file3.png", content_type: "image/png")
thirdList.save