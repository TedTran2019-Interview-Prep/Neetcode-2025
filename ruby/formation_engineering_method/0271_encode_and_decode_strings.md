```
# I don't have Leetcode premium...so I'm doing the code, translating to Python through ChatGPT, then
# pasting it into Neetcode's checker.
#
# Design an algorithm to encode a list of strings into a single string
# Then make sure the encoded string is decoded back to the original list of strings
#
# Input: ["neet","code","love","you"]
# (string length)word
# 4neet4code4love3you
# No matter what happens, your number is the first thing you run into, so you skip over all user input
# 444444code4love3you
# What happens when the length is multi-digit? Need some sort of delimiter, let's use #
# So, 4#, 44#, then whatever characters that come after are skipped
#
# So for encode
# make an empty string (ensure Ruby's frozen string literal is off) = ''
# iterate through strings, string
#   for each string, add string.length to the string, #, then the string itself
# return encoded string
#
# for decode
#   strs = []
#   index = 0
#   while index < encoded's length
#     num_characters = ''
#     until encoded[index] is a hashtag
#       add the number to num_characters
#       index += 1
#     num_characters = num_characters to int
#     index += 1
#     strs << encoded[index...index + characters]
#     index += characters
#   return strs
```
