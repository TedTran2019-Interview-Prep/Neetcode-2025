```ruby
=begin
accounts[i] is a list of strings
accounts[i][0] is a name, rest are emails
merge these accounts....
belong to same person if common email to both accounts
same name == may be different people, but same acc == always same name
Merge accounts then return in format: name, emails in sorted order

What is the data we need?
Across many accounts, we need to find accounts with matching emails then combine them together under the same name
Match all emails to indexes (in case it's same name diff person)
E.g, johnsmith@mail.com is present in account index 0 + 1...
john newyork is only present in account index 0....

make a graph and connect emails?
then once fully connected, set an account towards each connected set of emails, that's it
since undirected graph, you can start anywhere to reach all... then use a global set for no repeats
=end
```
