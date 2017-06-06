# Write a method, spiral_access, that takes a 2d square array (an array of arrays)
# and a block, and calls the block for each of the elements, in spiral order.
#
# HINT: This method is probably best sovled recursively
#
# Example:
# two_d = [
#   [ 1,  2,  3,  4, 5],
#   [16, 17, 18, 19, 6],
#   [15, 24, 25, 20, 7],
#   [14, 23, 22, 21, 8],
#   [13, 12, 11, 10, 9],
# ]
# order = []
# spiral_access two_d do |i|
#   order << i
# end
# order # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]

def spiral_access(square_array, &block)
  return if square_array.empty? || square_array.first.empty?

  ubound = square_array.length - 1

  # call block with items in the first row
  square_array.first.each do |i|
    block.call i
  end
  if ubound > 0
    # call block with last item of every subsequent row
    square_array[1..ubound].each do |row|
      block.call row[ubound]
    end
    # call block with items in the last row backwards
    square_array.last[0..ubound-1].reverse.each do |i|
      block.call i
    end
    # call block with items in the first column backwards, except fot the first item
    square_array[1..ubound-1].reverse.each do |row|
      block.call row.first
    end
  end
  new_square = square_array[1..square_array.length-2].map do |row|
    row[1..row.length-2]
  end

  if !new_square.empty?
    # call this function again on the inner square
    spiral_access new_square, &block
  end
end
