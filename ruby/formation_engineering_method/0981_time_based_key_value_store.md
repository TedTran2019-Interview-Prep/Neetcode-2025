```ruby
# Time-based key-value data structure that can store multiple values for same key at different time stamps
# Retrieve key's value at a certain time stamp

# TimeMap - initializes data structure
# set - Stores key w/ value at timestamp
# get (key timestamp): returns "" if no values, else returns largest timestamp less than or equal to that timestamp

# only get or set
# hashmap[key] -> array of timestamps
# All timestamps are strictly increasing, so you can just add and it'll be sorted
# When getting, binary search based on timestamp
```
