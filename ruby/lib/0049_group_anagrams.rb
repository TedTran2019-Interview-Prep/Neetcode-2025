# @param {String[]} strs
# @return {String[][]}
module GroupAnagrams
  # Hashmap as keys
  # can use an array instead of hashmap as the key
  # can also use the tally method instead of manually constructing hash
  def self.solution_one(strs)
    anagram_group = Hash.new { |k, v| k[v] = [] }
    strs.each do |str|
      char_count = Hash.new(0)
      str.each_char { |char| char_count[char] += 1 }

      anagram_group[char_count] << str
    end
    anagram_group.values
  end

  # Sorted strings as keys
  # group_by is pretty useful
  def self.solution_two(strs)
    strs.group_by { |str| str.chars.sort }.values
  end
end
