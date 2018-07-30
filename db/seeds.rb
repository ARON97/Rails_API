# Generate data using faker
# if we want to insert more then one data we use a loop
5.times do
	Article.create({
		# Faker::Book here is function from faker as stated in the documentation
		title: Faker::Book.title,
		# Faker::Lorem will give us a sentence for the body
		body: Faker::Lorem.sentence
	})
end