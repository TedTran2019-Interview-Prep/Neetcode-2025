# frozen_string_literal: true

def can_finish(num_courses, prerequisites)
  prereq_map = Hash.new { |h, k| h[k] = [] }
  prerequisites.each { |course, prereq| prereq_map[course] << prereq }
  visited = Set.new
  dfs = lambda do |course|
    return false if visited.include?(course)
    return true if prereq_map[course].empty?

    visited << course
    prereq_map[course].each { |prereq| return false unless dfs.call(prereq) }
    visited.delete(course)
    prereq_map[course] = []
  end

  (0...num_courses).each { |course| return false unless dfs.call(course) }
  true
end
