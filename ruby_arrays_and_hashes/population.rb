=begin
    
Write some code that takes the hash above then prints if the city is large 
(more than 100,000). Print something like: Vancouver is a large city
    
=end

bc_cities_population = { vancouver: 2135201, victoria: 316327, abbotsford: 149855, kelowna: 141767, nanaimo: 88799, white_rock: 82368, kamloops: 73472, chilliwack: 66382 }

bc_cities_population.each do |city, population|
    p "#{city.capitalize} is a large city" if population > 100_000
end


