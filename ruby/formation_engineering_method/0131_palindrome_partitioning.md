```ruby
=begin
Partition a string
Return it if every partition is a palindrome
This means validate as you go along, and return early if any prior is not a palindrome

How to partition a string?
results = []
dfs = lambda do |start, path|
    if start == s.length
        add to results

    index...s.length do idx
        part = start..idx
        next unless part.palindrome?
        path << part
        dfs.call(index + 1, path)
        path.pop

call dfs
return results
=end
```
