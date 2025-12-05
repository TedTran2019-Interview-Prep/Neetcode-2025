# frozen_string_literal: true

class MyHashMap
  def initialize
    @size = 0
    @internal_size = 10
    @buckets = Array.new(@internal_size) { [] }
  end

  #     :type key: Integer
  #     :type value: Integer
  #     :rtype: Void
  def put(key, value)
    hashed_key = my_hash(key)
    duplicate = false
    @buckets[hashed_key].each do |ele|
      next unless key == ele[0]

      duplicate = true
      ele[1] = value
      break
    end
    return if duplicate

    @size += 1
    @buckets[hashed_key] << [key, value]
  end

  #     :type key: Integer
  #     :rtype: Integer
  def get(key)
    @buckets[my_hash(key)].each { |ele| return ele[1] if ele[0] == key }
    -1
  end

  #     :type key: Integer
  #     :rtype: Void
  def remove(key)
    hashed_key = my_hash(key)
    delete_idx = nil
    bucket = @buckets[hashed_key]
    bucket.each_with_index do |ele, idx|
      if ele[0] == key
        delete_idx = idx
        break
      end
    end
    @buckets[hashed_key].delete_at(delete_idx) unless delete_idx.nil?
  end

  private

  def resize
    @internal_size *= 2
    @size = 0
    old = @buckets
    @buckets = Array.new(@internal_size) { [] }
    old.each do |bucket|
      bucket.each { |key, value| add(key, value) }
    end
  end

  def my_hash(key)
    key % @internal_size
  end
end
