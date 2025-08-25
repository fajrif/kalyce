specialists = [
	{ name: 'AESTHETICS', headline: 'Visit our aesthetics program to learn about health & wellness, and the different ways it is providing nourishment' },
	{ name: 'NUTRITION', headline: 'Visit our nutritionists to learn about food and its effects on health, and the different ways it is providing nourishment' },
	{ name: 'PLASTIC SURGERY', headline: 'A visit to our team of plastic surgeons to get the best advice and options on elective procedures' },
	{ name: 'PHARMACY', headline: 'Our pharmacists prepare and dispense the drugs and medications of our patients, and help advise them on their use' }
]

Specialist.delete_all
puts "create specialists"
specialists.each_with_index do |obj, num|
	i = Specialist.new(name: obj[:name])
	i.headline = obj[:headline]
	desc = ""
	2.times do
		desc += "<p>#{ FFaker::Lorem.paragraphs(5).join(" ") }</p>"
	end
	i.description = desc
  i.image.attach(io: File.open(Rails.root.join("vendor/assets/images/logo-icon.png")), filename: "logo-icon.png")
	i.save!
end
