# frozen_string_literal: true

def find_judge(n, trust)
  person_to_who_they_trust = Hash.new { |h, k| h[k] = [] }
  person_to_who_trusts_them = Hash.new { |h, k| h[k] = [] }
  trust.each do |a, b|
    person_to_who_they_trust[a] << b
    person_to_who_trusts_them[b] << a
  end
  (1..n).each do |person|
    return person if person_to_who_they_trust[person].empty? &&
                     person_to_who_trusts_them[person].length == n - 1
  end
  -1
end
