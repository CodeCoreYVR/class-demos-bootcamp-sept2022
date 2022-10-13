# Canadian provinces

canada = {
    "BC" => "Victoria",
    :Alberta => "Edmonton",
    Saskatchewan: "Regina"
}

canada.each{ |province, city| puts "#{province}'s capital is #{city}."}
canada.each_key{ |province| puts province }
canada.each_value{ |capital| puts capital }
