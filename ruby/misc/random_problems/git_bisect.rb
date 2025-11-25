=begin
linear commits from 1 to n
find first bad commit
everything after first bad is bad
everything before first bad is good
Use as few calls as possible
Guaranteed 1 bad? Or return -1?
versions is an array of good/bad
since 1 to n, can just do whatever you find +1
[good good good good good bad bad bad]
(0 + array.length - 1) = 7 / 2 = 3
land in good -> ignore everything current and left
move left pointer to 3 + 1
(4 + 7) = 11 / 2 = 5
it's a bad! If left node is good, return this +1
If left node is bad, make right pointer = this place - 1
Binary search!
=end
def first_bad_version(versions)
  left = 0
  right = versions.length - 1
  while left <= right
    middle = (left + right) / 2
    if versions[middle] == 'good'
      left = middle + 1
    elsif versions[middle] == 'bad'
      return middle + 1 if versions[middle - 1] == 'good' || (middle - 1).negative?

      right = middle - 1
    end
  end
  -1
end

def create_versions(n, first_bad)
  versions = Array.new(n, 'good')
  (first_bad - 1...n).each { |idx| versions[idx] = 'bad' }
  versions
end

versions = create_versions(8, 6)
puts first_bad_version(versions) == 6
versions = create_versions(5, 1)
puts first_bad_version(versions) == 1
versions = create_versions(10, 10)
puts first_bad_version(versions) == 10
versions = create_versions(1, 1)
puts first_bad_version(versions) == 1
