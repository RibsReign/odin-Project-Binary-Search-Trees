# frozen_string_literal: true

# s
class Array
  def merge_sort
    return self if length <= 1

    middle = length / 2
    left = slice(0, middle).merge_sort
    right = slice(middle, length).merge_sort

    merge(left, right)
  end

  private

  def merge(left, right)
    merged = []

    merged << (left.first < right.first ? left.shift : right.shift) while !left.empty? && !right.empty?
    merged.concat(left).concat(right)
  end
end
