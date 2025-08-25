# CREATE Category
Category.delete_all

puts "create categories"

# Category
Category.delete_all
["Aesthetic", "Nutirion / Dietary", "Supplements"].each do |name|
	Category.create!(name: name)
end
