```ruby
=begin
Post tweets
Follow/unfollow another user
See 10 most recent tweets

postTweet(userId, tweetId) -> unique tweetID
getNewsFeed(10 most recent tweet IDs), posted by users that followed OR by user themselves
follow(followerId, followeeId) -> follower follows followee
unfollow -> follower unfollows followee

Map of follows?
Follower_id: followees (as a set): Easy to add/remove
Follower should always have himself as a followee
- Or if using a separate class for User, can encapsulate within class

postTweet = each follower has a list of tweets, with the last items added = most recent (array is fine here), each tweet given an ID [ID, timestamp]
What about getNewsFeed? How would one do this efficiently?
Inefficient way: Go through self and followers, find 10 most recent tweets.
How to do? Add everything to max heap (since you want most recent aka highest number)
do merge K sorted lists style...
add last element of every array to max heap
index -= 1, if index is negative, don't add another element from that array
pop from heap
repeat until heap empty OR length of list == 10
=end
```
