```ruby
# array of strings tokens that represent arithmetic expressions in RPN
# aka operators follow operands
# - 4 valid operators (+ - * /)
# - Each operand may be an integer or another expression (recursive?)
# - Division between 2 integers truncates towards zero
# - No division by zero
# - Input is always valid in RPN
# - Everythign can be represented in a 32 bit int (w/e for Ruby)
# - Token length is always > 1 so no empty strings
# Hardest part: Ruby's division is floored, but we need truncated (up/down to zero)
# So it's necessary to use fdiv then Ruby's truncate method!
# 2 1 + 3 *
# 2 1 + = 3
# 3 * 3 = 9

# 4 13 5 / +
# 4 + (13 / 5) = 6
# /
# 4 13 5
# +
# 4 2
# 6

# (Top of the stack is second operand)
# 10 6 9 3 + -11 * / * 17 + 5 +
# +
# 10 6 9 3
# *
# 10 6 12 -11
# /
# 10 6 -132
# *
# 10 (6 / -132 = 0)
# +
# 0 17
# +
# 17 5
# 22

# Plan:
# stack = []
# tokens.each do token
#     for each token, add to stack if it's a number
#     if it's not a number, pop 2 items from the stack
#     second = stack.pop
#     first = stack.pop
#     then do first operand second and add that back to the stack

# return the final item in the stack
```
