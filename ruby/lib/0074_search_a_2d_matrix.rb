# Index math solution
def search_matrix(matrix, target)
  rows = matrix.length
  cols = matrix[0].length
  left = 0
  right = (rows * cols) - 1

  while left <= right
    middle = (left + right) / 2
    row = middle / cols
    col = middle % cols
    if matrix[row][col] == target
      return true
    elsif target < matrix[row][col]
      right = middle - 1
    else
      left = middle + 1
    end
  end

  false
end

# NC solution
def search_matrix(matrix, target)
  row = binary_search_row(matrix, target)
  return false if row.negative?

  binary_search(matrix[row], target)
end

def binary_search_row(matrix, target)
  top = 0
  bottom = matrix.length - 1
  last_col = matrix[0].length - 1
  while top <= bottom
    middle = (top + bottom) / 2
    if target < matrix[middle][0]
      bottom = middle - 1
    elsif target > matrix[middle][-1]
      top = middle + 1
    else
      return middle
    end
  end
  -1
end

def binary_search(array, target)
  left = 0
  right = array.length - 1
  while left <= right
    middle = (left + right) / 2
    if array[middle] == target
      return true
    elsif array[middle] < target
      left = middle + 1
    else
      right = middle - 1
    end
  end
  false
end

# My solution
def search_matrix(matrix, target)
  rows = matrix.length
  cols = matrix[0].length
  binary_search_row = lambda do
    left = 0
    right = rows - 1
    col = cols - 1
    while left <= right
      middle = (left + right) / 2
      if matrix[middle][col] == target
        return [middle, col]
      elsif matrix[middle][col] > target
        return [middle] if middle.zero? || target > matrix[middle - 1][col]

        right = middle - 1

      else
        left = middle + 1
      end
    end
    [-1]
  end

  row = binary_search_row.call
  return true if row.length == 2
  return false if row[0] == -1

  binary_search(matrix[row[0]], target)
end

def binary_search(array, target)
  left = 0
  right = array.length - 1
  while left <= right
    middle = (left + right) / 2
    if array[middle] == target
      return true
    elsif array[middle] < target
      left = middle + 1
    else
      right = middle - 1
    end
  end
  false
end
