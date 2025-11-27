```ruby
=begin
execute program containing n functions
uniq ID between 0 and n-1 per function
calls stored in a call stack
call starts -> ID pushed onto stack
call ends -> popped off stack
ID on top of stack is current being executed
start/end = write log w/ ID, start/end, timestamp
logs, logs[i] represents the ith log message
functions can be called multiple times, possibly recursively
exclusive time: sum of execution time for all function calls in program
return exclusive time of each function in an array
logs are ordered by timestamp

0 starts at 0, push onto stack
1 starts at 2, push onto stack
1 ends at 5, pop 1 from stack. 5 - 2 (-1) = 4 units of time towards [1]
0 ends at 6, 6 - 0 - 4 (-1) = 3
Issue: must subtract result of internal time periods from external ones

How do know if it's internal? Aka overlapping periods?
Stack isn't empty
This can be an internal loop as many times as needed

Case:
        ---
     --     ------
-----             -----
stack << A
stack << B
stack << C
stack pop C
stack pops B
stack << B2
stack pops B2
stack pops A

Can subtract size of internal from parent (found by peeking into stack)
=end
```
