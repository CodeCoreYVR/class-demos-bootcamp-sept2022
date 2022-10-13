a = [
	['john', 'steve', 'jen'],
	['ate', 'sat on', 'bought'],
	['an apple', 'the couch', 'a toothbrush']
]

puts a.map{ |words| words.sample }.join(" ")


