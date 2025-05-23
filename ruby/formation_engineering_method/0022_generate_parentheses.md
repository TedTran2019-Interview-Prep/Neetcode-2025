```ruby
# n pairs of parentheses, generate all combinations of well-formed parentheses
# Combination = order doesn't matter
# All = many answers
# Think about case of 3
# ()()() -> Threee parentheses by themselves
# ((())) -> Fully layered within each other
# (()()) -> One holding two
# (())() -> Left holding one
# ()(()) -> Right holding one
# Maybe recursion?
# For every opening bracket, you either add another opening bracket or a closing bracket
# Once you reach the proper number of opening brackets and closing brackets, add to results
# Why can't you just do (n * 2 - open) closing brackets to paren when open == n?
# You're on many branching paths, but you shortcut and cut out early by doing that

# Plan:
# parentheses = []
# generate = lambda do |num open, num close, paren|
#     if close > open, just return
#     if open > n, just return
#     if open == n && open == close, add paren to parentheses

#     generate.call(open + 1, close, paren + '(')
#     generate.call(open, close + 1, paren + ')')

# parentheses
```
