```ruby
# Given string S containing parens: (, {, [ and its closer
# Determine if its valid?
# 1. Open must be closed by same type of brackets
# 2. Open must be closed in correct order
# 3. Every close must have corresponding open of same type
# Go through string, for each char
# ([])
# ([
# Add all opening brackets to a stack
# When seeing a closing bracket, it has to match with top of stack or FALSE.
# Pop value from stack.
# At the very end, the stack has to be empty

# Plan:
# stack = []
# pairs = {
#     the pairs
# }
# iterate through s, for each char
#     if opening bracket
#         add to stack
#     else
#         check if closing matches with opening (return false if not)
#         - How to do this check? Hashmap of puts in closing, gets opening
# stack.empty?
```
