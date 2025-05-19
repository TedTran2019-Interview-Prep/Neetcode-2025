# @param {Integer[]} piles
# @return {Integer}
def max_coins(piles)
  my_coins = 0
  piles.sort!
  left = 0
  right = piles.length - 1
  while left < right
    my_coins += piles[right - 1]
    left += 1
    right -= 2
  end

  my_coins
end
