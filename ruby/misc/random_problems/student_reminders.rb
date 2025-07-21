# 100 students (0-99 IDs)
# sorted list
# have registered
# produce a list of who to remind
# single missing = just number as string
# if more than 1 in a row is missing, show as a range inclusive
# [48, 50]
# 0-47, 49, 51-99
#
#
# Iterate through array with index, each ID
#   if first element isn't 0...
#   if last element isn't 99...
#   if gap between this element and prev element is greater than 1, make a range of prev element + 1 to this element - 1 else just put the number itself, aka element - 1. Do the same for first and last element too, but with the special case being...
#   1 - 0 = 1
#   99 - 98 = 1

def must_register(registered_students)
  return ['0-99'] if registered_students.empty?

  reminders = []

  registered_students.each_with_index do |student, idx|
    prev_student = registered_students[idx - 1]
    prev_student = -1 if idx.zero?
    next unless prev_student + 1 != student

    reminders << if student - prev_student == 2
                   (student - 1).to_s
                 else
                   "#{prev_student + 1}-#{student - 1}"
                 end
  end
  if registered_students[-1] != 99
    reminders << if 99 - registered_students[-1] == 1
                   '98'
                 else
                   "#{registered_students[-1] + 1}-99"
                 end
  end

  reminders
end

print must_register([48, 50]) # ["0-47", "49", "51-99"]
puts
puts(must_register([]) == ['0-99'])
puts(must_register([50]) == %w[0-49 51-99])
puts(must_register([0]) == ['1-99'])
puts(must_register([1]) == %w[0 2-99])
puts(must_register([99]) == ['0-98'])
puts(must_register([48, 50]) == %w[0-47 49 51-99])
puts(must_register([47, 50]) == %w[0-46 48-49 51-99])
puts(must_register([47, 48, 49, 50]) == %w[0-46 51-99])

# Problem revisit on 7/20/25
# 100 students (IDs 0-99)
# Sorted list of student IDs
# - Single missing student (number as str)
# - If 1+ student missing, range string
#
# So basically given a list of students who are present...
#
# Find starting number (let's say 0)
# If we start at 2, we know 0-1 are missing
# Aka the starting number up to current - 1
# Exception is the end, last number found (if not 99) + 1 up til' 99
#
# starting_number = 0
# current_number = 48
# fill in 0-47 then move on
# starting_number = 49
# current_number = 50
# fill in 49 - 49 aka just 49
# end of array
# starting_number = 51
# fill in 51 - 99

def must_register(data)
  starting_number = 0
  missing_student_ids = []
  data.each do |current_number|
    if current_number == starting_number
      starting_number += 1
    else
      goal = current_number - 1
      missing_student_ids << (goal == starting_number ? goal.to_s : "#{starting_number}-#{goal}")
      starting_number = current_number + 1
    end
  end
  if starting_number <= 99
    missing_student_ids << (starting_number == 99 ? '99' : "#{starting_number}-99")
  end
  missing_student_ids
end
