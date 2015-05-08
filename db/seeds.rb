require 'csv'

csv = File.read('reviews.csv')
reviews = CSV.parse(csv, :headers => true)
reviews.each do |row|
	r = row.to_hash.symbolize_keys
	stay = Stay.new({
			rating: r[:rating],
			dogs: r[:dogs],
			review: r[:text],
			start_date: r[:start_date],
			end_date: r[:end_date]
		})
	sitter = Sitter.where(name: r[:sitter]).first || Sitter.create!({ name: r[:sitter] })
	stay.sitter_id = sitter.id
	stay.save
end
