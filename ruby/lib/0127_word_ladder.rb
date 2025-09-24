# frozen_string_literal: true

# Tricky graph construction taking advantage of word length constraints
def ladder_length(begin_word, end_word, word_list)
  return 0 if begin_word == end_word

  graph = construct_graph(begin_word, word_list)
  # Let's BFS now
  queue = [begin_word]
  visited = Set.new
  visited << begin_word
  steps = 1
  until queue.empty?
    new_queue = []
    queue.each do |word|
      return steps if word == end_word

      word.each_char.with_index do |char, idx|
        pattern = word[0...idx] + '*' + word[idx + 1..]
        graph[pattern].each do |adj_word|
          next if visited.include?(adj_word)

          new_queue << adj_word
          visited << adj_word
        end
      end
    end
    queue = new_queue
    steps += 1
  end
  0
end

def construct_graph(begin_word, word_list)
  graph = Hash.new { |h, k| h[k] = [] }
  word_list.each do |word|
    word.each_char.with_index do |char, idx|
      pattern = word[0...idx] + '*' + word[idx + 1..]
      graph[pattern] << word
    end
  end
  graph
end

###############################################################################################

# Didn't pass LC time limit tests
def ladder_length(begin_word, end_word, word_list)
  return 0 if begin_word == end_word

  graph = construct_graph(begin_word, word_list)
  # Let's BFS now
  queue = [begin_word]
  visited = Set.new
  visited << begin_word
  steps = 1
  until queue.empty?
    new_queue = []
    queue.each do |word|
      return steps if word == end_word

      graph[word].each do |adj_word|
        next if visited.include?(adj_word)

        new_queue << adj_word
        visited << adj_word
      end
    end
    queue = new_queue
    steps += 1
  end
  0
end

def construct_graph(begin_word, word_list)
  graph = Hash.new { |h, k| h[k] = [] }
  add_neighbors_list(graph, begin_word, word_list)
  word_list.each { |word| add_neighbors_list(graph, word, word_list) }
  graph
end

def add_neighbors_list(graph, word, word_list)
  word_list.each do |adjacent_word|
    next if word == adjacent_word

    graph[word] << adjacent_word if differs_single(word, adjacent_word)
  end
end

# Assumption that all words are the same length
def differs_single(word, adjacent_word)
  diffs = 0
  word.each_char.with_index do |char, idx|
    diffs += 1 if char != adjacent_word[idx]
    return false if diffs > 1
  end
  diffs == 1
end
