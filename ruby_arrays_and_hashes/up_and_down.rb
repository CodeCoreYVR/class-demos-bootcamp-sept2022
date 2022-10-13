sentence = gets.chomp

new_sentence = sentence.split(' ').map.with_index do |word, index|
    if index % 2 == 0
        word.upcase!
    else
        word.downcase!
    end
    word
end

p new_sentence.join(' ')

