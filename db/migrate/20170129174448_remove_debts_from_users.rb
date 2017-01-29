class RemoveDebtsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :debts, :string
  end
end
