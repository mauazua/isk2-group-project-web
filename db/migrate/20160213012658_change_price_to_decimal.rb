class ChangePriceToDecimal < ActiveRecord::Migration
  def change
    change_column :events, :price, :decimal
  end
end
