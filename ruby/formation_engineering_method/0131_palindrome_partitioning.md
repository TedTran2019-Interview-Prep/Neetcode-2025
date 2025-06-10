- Code for the redo on 6/9/25

```ruby
=begin
string s, partition s so that every substring is a palindrome
partition s
as you're partitioning, return early (kill path) if any prior substring is not a palindrome

result = []
dfs = lambda do |start, path|
    result << path.dup and return if start == s.length
    (start...s.length).times do |index|
        beginning = s[start..index]
        next unless beginning == beginning.reverse
        path << beginning
        dfs.call(index + 1, path)
        path.pop
    end
end
dfs.call(0, [])
result
=end
```

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
