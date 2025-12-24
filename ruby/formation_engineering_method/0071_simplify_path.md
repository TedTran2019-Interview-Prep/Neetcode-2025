```ruby
=begin
Absolute path for Unix-style file system
'/' -> transform into simplified canonical path
'.', '..', '///'
Path must start with '/'
Separated by exactly one slash
Split path
Skip if empty
If '.', just get rid of it
If '..', pop previous element in stack
=end
```
