def caesar_cipher(string, number)
  arr = [("A".."Z").to_a, ("a".."z").to_a]
  string = string.split("")

  string = string.map do |item|
    if arr[0].include?(item)
      index = arr[0].find_index(item) - number
      item = arr[0][index]
    elsif arr[1].include?(item)
      index = arr[1].find_index(item) - number
      item = arr[1][index]
    else
      item
    end
  end
  string.join
end

puts caesar_cipher("Hai World", 2)