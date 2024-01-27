def caesar_cipher(string, number, direction)
  arr = [("A".."Z").to_a, ("a".."z").to_a]
  direction = direction.downcase

  string = string.split("").map! do |item|
    if direction == "left"
      if arr[0].include?(item)
        index = arr[0].find_index(item) - number
        item = arr[0][index]
      elsif arr[1].include?(item)
        index = arr[1].find_index(item) - number
        item = arr[1][index]
      else
        item
      end
    elsif direction == "right"
      if arr[0].include?(item)
        index = arr[0].find_index(item) + number
        index = index - 26 if index > 25
        item = arr[0][index]
      elsif arr[1].include?(item)
        index = arr[1].find_index(item) + number
        index = index - 26 if index > 25
        item = arr[1][index]
      else
        item
      end
    end
  end
  string.join
end

puts caesar_cipher("Hai, World!", 1, "left")
puts caesar_cipher("Hai, World!", 1, "right")

def caesar_cipher_ord(string, number)
  string = string.split("").map do |item|
    if (65..90).include?(item.ord)
      shifted = item.ord - number
      shifted = 90 - (64 - shifted) if shifted < 65
      item = shifted.chr
    elsif (97..122).include?(item.ord)
      shifted = item.ord - number
      shifted = 122 - (96 - shifted) if shifted < 97
      item = shifted.chr
    else
      item
    end
  end
  string.join
end

puts caesar_cipher_ord("Hai, World!", 1)