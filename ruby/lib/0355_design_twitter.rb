# frozen_string_literal: true

class Twitter
  def initialize
    @follow_map = Hash.new { |h, k| h[k] = Set.new }
    @tweet_map = Hash.new { |h, k| h[k] = [] }
    @time = 0
  end

  def post_tweet(user_id, tweet_id)
    @tweet_map[user_id] << [tweet_id, @time]
    @time += 1
  end

  def get_news_feed(user_id)
    news_feed = []
    heap = Heap.new { |a, b| a[1] > b[1] }
    @follow_map[user_id] << user_id
    last_elements = []
    # Get last element of every feed
    @follow_map[user_id].each do |followee|
      next if @tweet_map[followee].empty?

      tweet_id, count = @tweet_map[followee][-1]
      last_index = @tweet_map[followee].length - 1
      last_elements << [tweet_id, count, last_index, followee]
    end
    heap.heapify(last_elements)

    until heap.empty? || news_feed.length == 10
      tweet_id, count, index, followee = heap.pop
      news_feed << tweet_id
      next if index.zero?

      new_tweet_id, new_count = @tweet_map[followee][index - 1]
      heap << [new_tweet_id, new_count, index - 1, followee]
    end
    news_feed
  end

  def follow(follower_id, followee_id)
    @follow_map[follower_id] << followee_id
  end

  def unfollow(follower_id, followee_id)
    @follow_map[follower_id].delete(followee_id)
  end
end
