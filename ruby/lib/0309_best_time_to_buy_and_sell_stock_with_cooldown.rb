# frozen_string_literal: true

def max_profit(prices)
  dp = {}
  dfs = lambda do |index, sell|
    return 0 if index >= prices.length

    key = [index, sell]
    return dp[key] if dp.key?(key)

    stock_action = if sell
                     prices[index] + dfs.call(index + 2, !sell)
                   else
                     -prices[index] + dfs.call(index + 1, !sell)
                   end
    do_nothing = dfs.call(index + 1, sell)
    dp[key] = [stock_action, do_nothing].max
  end
  dfs.call(0, false)
end
