class AddUsersToDebts < ActiveRecord::Migration
  def change
    add_reference :debts, :user, index: true, foreign_key: true
  end
end
