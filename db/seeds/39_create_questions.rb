# FAQ
Question.delete_all
puts "create FAQs"
5.times do
	Question.create(question: FFaker::Lorem.sentence, answer: FFaker::Lorem.paragraphs(rand(5)+2).join(" "), category_name: "General")
end
