#TAGS

tags = ["Advertising", "Advice", "Android", "Africa", "Anime", "Apple",
"Architecture", "Art", "Baking", "Beauty", "Blog", "Book", "Business", "Canada",
"Cars", "Cartoons", "Celebrities", "Comedy", "Comics", "Cooking", "Crafts",
"Dating", "Design", "Dogs", "Drawing", "Economy", "Education", "Entertainment",
"Environment", "Events", "Excercise", "Family", "Fantasy", "Fashion", "Film",
"Fitness", "Folk", "Food", "Football", "Fun", "Funny", "Games",
"Graphic Design", "Health", "History", "Internet", "Love", "Law", "Lifestyle",
"Management", "Marketing", "Media", "Mobile", "Money", "Movies", "Music",
"Nature", "News", "Nutrition", "Painting", "Personal", "Pets", "Philosophy",
"Photography", "Poetry", "Politics", "Relationships", "Recipes", "Sex",
"Shopping", "Social Media", "Software", "Sports", "Technology", "Tips",
"Travel", "TV", "Vacation", "Video", "Videogames", "Web", "Web Design",
"Wildlife", "Wine", "Writing"]

tags.each do |tag|
  Tag.create({name: tag})
end

  tags = Tag.all

#CATEGORY

categories = ["Fitness", "Technology", "Education", "Travel", "Food", "Misc."]

categories.each do |category|
  Category.create({title: category})
end

#POSTS

20.times do
  Post.create ({ title:Faker::Book.title,
                 body: Faker::Hipster.paragraph,
                 tags: tags.sample(rand(3)+1),
                 category_id: rand(10) + 1
                 })
               end


puts "Generated things."
