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

puts caesar_cipher("Hi, World!", 1, "left")
puts caesar_cipher("Hi, World!", 1, "right")