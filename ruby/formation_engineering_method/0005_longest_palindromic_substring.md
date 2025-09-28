```ruby
=begin
Given a string, return the longest palindromic (same forwards and backwards) substring
'babad' -> 'bab' or 'aba'

What would be a brute force approach:
Try every single permutation of letters (N!)
Get max palindrome and return

How do Palindromes work?
There are odd and even palindromes
'aa'
'aba'
Start from center and check outwards
Size of s is at least 1

Plan:
longest = ''
iterate from each char in s with index
    check odd palindrome
    l, r = index
    ensure in bounds
    as long as l, r are the same, keep expanding outwards and adding to palindrome count
    replace longest if longer

    check even palindrome
    l, r = index, index + 1
    ensure in bounds
    as long as l, r are the same, keep expanding outwards and adding to palindrome count
    replace longest if longer
longest
=end
```
