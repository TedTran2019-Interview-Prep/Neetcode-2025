# frozen_string_literal: true

class MyHashSet
  def initialize
    @size = 0
    @internal_size = 10
    @buckets = Array.new(@internal_size) { [] }
  end

  #     :type key: Integer
  #     :rtype: Void
  def add(key)
    hashed_key = my_hash(key)
    duplicate = false
    @buckets[hashed_key].each { |ele| duplicate = true if key == ele }
    return if duplicate

    @size += 1
    @buckets[hashed_key] << key
  end

  #     :type key: Integer
  #     :rtype: Void
  def remove(key)
    hashed_key = my_hash(key)
    delete_idx = @buckets[hashed_key].index(key)
    @buckets[hashed_key].delete_at(delete_idx) unless delete_idx.nil?
  end

  #     :type key: Integer
  #     :rtype: Boolean
  def contains(key)
    @buckets[my_hash(key)].any? { |ele| ele == key }
  end

  private

  def resize
    @internal_size *= 2
    @size = 0
    old = @buckets
    @buckets = Array.new(@internal_size) { [] }
    old.each do |bucket|
      bucket.each { |key| add(key) }
    end
  end

  def my_hash(key)
    key % @internal_size
  end
end
