# Treatment
Treatment.delete_all

puts "create treatments"

treatments = [
  "Filler",
  "Botox",
  "Slimming",
  "Laser & IPL",
  "Anti Aging Treatment",
  "Hair Growth Treatment"
]

treatments.each do |name|
	Treatment.create(name: name, description: FFaker::Lorem.paragraphs(rand(5)+2).join(" "))
end
