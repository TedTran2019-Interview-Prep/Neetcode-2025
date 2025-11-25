# Given vertex/edge list
# Given 2 user IDs, need to find out if they are friends of friends
# E.g, can user 1 reach user 2, are they connected, but not directly
# Construct adjacency list
# Traverse through user1 and see if user2 is present, but NOT as the first connection
# assuming non-directed graph (friends are mutual)
#
# Misunderstood problem-- they want EXACTLY friend of friend, exactly 2 connections away.
#
# Just do a BFS and see if user2 is within the list of connections exactly 2 away.

def isFOF(vertex_list, edge_list, user1, user2)
  return false if user1 == user2

  graph = Hash.new { |h, k| h[k] = [] }
  edge_list.each do |a, b|
    graph[a] << b
    graph[b] << a
  end

  queue = [user1]
  visited = Set.new
  distance = 2
  until distance.zero?
    new_queue = []

    queue.each do |user|
      next if visited.include?(user)

      visited << user
      graph[user].each { |friend| new_queue << friend }
    end
    queue = new_queue
    distance -= 1
  end
  queue.include?(user2)
end

users = %w[Jeff Susan Ed Fred Jason Zach]
friends = [
  %w[Jeff Susan],
  %w[Jeff Fred],
  %w[Susan Ed],
  %w[Ed Fred],
  %w[Jason Zach]
]

# Jeff---|
#  |     |
# Susan  |   Jason - Zach
#  |     |
#  Ed - Fred

# Happy path
puts isFOF(users, friends, 'Jeff', 'Ed')
puts isFOF(users, friends, 'Ed', 'Jeff')
puts isFOF(users, friends, 'Susan', 'Fred')
puts isFOF(users, friends, 'Fred', 'Susan')

# Too close: Jason -> Zach (distance 1)
puts isFOF(users, friends, 'Jason', 'Zach') == false

# Distance 1 or 3: Jeff -> Fred / Jeff -> Susan -> Ed -> Fred
puts isFOF(users, friends, 'Jeff', 'Fred') == false

# Nonexistent path
puts isFOF(users, friends, 'Zach', 'Jeff') == false
puts isFOF(users, friends, 'Jeff', 'Zach') == false

# Users not in the network
puts isFOF(users, friends, 'Foo', 'Jeff') == false
puts isFOF(users, friends, 'Jeff', 'Foo') == false
puts isFOF(users, friends, 'Foo', 'Bar') == false

users = %w[Ben Emily Ana Chris John Jess Ken]
friends = [
  %w[Chris Ben],
  %w[Chris Emily],
  %w[Chris Ana],
  %w[Chris John],
  %w[Chris Jess],
  %w[Chris Ken]
]

# Ben ---|  |--- Emily
# Ana -- Chris - John
# Jess --|  |--- Ken

puts isFOF(users, friends, 'Ben', 'Ana')
puts isFOF(users, friends, 'Ana', 'Ben')
puts isFOF(users, friends, 'Jess', 'Ana')
puts isFOF(users, friends, 'Emily', 'Ben')
puts isFOF(users, friends, 'John', 'Ken')
puts isFOF(users, friends, 'Ken', 'Emily')

puts isFOF(users, friends, 'Chris', 'Ben') == false
puts isFOF(users, friends, 'Chris', 'Ana') == false
puts isFOF(users, friends, 'Chris', 'Jess') == false
puts isFOF(users, friends, 'Chris', 'Emily') == false
puts isFOF(users, friends, 'Chris', 'John') == false
puts isFOF(users, friends, 'Chris', 'Ken') == false
puts isFOF(users, friends, 'Ken', 'Chris') == false

users = %w[Ben Emily Ana Tony Chris John Jess Ken]
friends = [
  %w[Tony Ben],
  %w[Tony Jess],
  %w[Tony Ana],
  %w[Tony Chris], # friend bridge
  %w[Chris Emily],
  %w[Chris John],
  %w[Chris Ken]
]

# Ben ---|        |---- Emily
# Ana - Tony -- Chris - John
# Jess --|        |---- Ken

puts isFOF(users, friends, 'Chris', 'Ben')
puts isFOF(users, friends, 'Chris', 'Ana')
puts isFOF(users, friends, 'Chris', 'Jess')
puts isFOF(users, friends, 'Tony', 'Emily')
puts isFOF(users, friends, 'Tony', 'John')
puts isFOF(users, friends, 'Tony', 'Ken')

# Distance 3
puts isFOF(users, friends, 'Ben', 'Emily') == false
puts isFOF(users, friends, 'Ana', 'John') == false
puts isFOF(users, friends, 'Jess', 'Ken') == false
