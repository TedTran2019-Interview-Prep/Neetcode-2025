# frozen_string_literal: true

def check_if_prerequisite(num_courses, prerequisites, queries)
  courses = Hash.new { |h, k| h[k] = [] }
  prerequisites.each { |a, b| courses[a] << b }
  cache = {}
  dfs = lambda do |pre_req, target, visited|
    return true if pre_req == target
    return false if visited.include?(pre_req)

    key = [pre_req, target]
    return cache[key] if cache.key?(key)

    visited << pre_req
    courses[pre_req].each do |course|
      cache[key] = dfs.call(course, target, visited)
      return cache[key] if cache[key]
    end
    cache[key] = false
  end
  queries.map { |pre_req, target| dfs.call(pre_req, target, Set.new) }
end
