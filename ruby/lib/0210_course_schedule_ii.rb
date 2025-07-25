# frozen_string_literal: true

def find_order(num_courses, prerequisites)
  prereq_map = Hash.new { |h, k| h[k] = [] }
  prerequisites.each { |course, prereq| prereq_map[course] << prereq }
  visited = Set.new
  seen = Set.new
  course_order = []

  dfs = lambda do |course|
    return false if visited.include?(course)
    return true if seen.include?(course)

    visited << course
    prereq_map[course].each { |prereq| return false unless dfs.call(prereq) }
    visited.delete(course)
    seen.add(course)
    course_order << course
  end

  (0...num_courses).each { |course| return [] unless dfs.call(course) }
  course_order
end
