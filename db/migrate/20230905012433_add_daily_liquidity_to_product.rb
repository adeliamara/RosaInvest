class AddDailyLiquidityToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :daily_liquidity, :decimal
  end
end
