class Trie
  def initialize
    @map = {}
    @map[:word] = false
  end

  def insert(word)
    return if word.empty?

    map = @map
    word.each_char do |char|
      map[char] ||= {}
      map = map[char]
    end

    map[:word] = true
  end

  def search(word)
    map = @map
    word.each_char do |char|
      return false unless map[char]

      map = map[char]
    end

    !!map[:word]
  end

  def starts_with(prefix)
    map = @map
    prefix.each_char do |char|
      return false unless map[char]

      map = map[char]
    end

    true
  end
end
