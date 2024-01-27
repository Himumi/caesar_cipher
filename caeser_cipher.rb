def caesar_cipher(string, number, direction = "left")
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
        index = arr[0].reverse.find_index(item) - number
        item = arr[0].reverse[index]
      elsif arr[1].include?(item)
        index = arr[1].reverse.find_index(item) - number
        item = arr[1].reverse[index]
      else
        item
      end
    end
  end
  string.join
end

puts caesar_cipher("Hai, World!", 10)
puts caesar_cipher("Hai, World!", 1, "right")

def caesar_cipher_ord(string, number, direction = "left")
  direction = direction.downcase
  string = string.split("").map do |item|
    if direction == "left"
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
    elsif direction == "right"
      if (65..90).include?(item.ord)
        shifted = item.ord + number
        shifted = 65 + (91 - shifted) if shifted > 90
        item = shifted.chr
      elsif (97..122).include?(item.ord)
        shifted = item.ord + number
        shifted = 97 + (123 - shifted) if shifted > 122
        item = shifted.chr
      else
        item
      end
    end
  end
  string.join
end

puts caesar_cipher_ord("Hai, World!", 10)
puts caesar_cipher_ord("zZ", 1, "right")