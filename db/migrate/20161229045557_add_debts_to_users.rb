class AddDebtsToUsers < ActiveRecord::Migration
	def change
		add_column :users, :debts, :string
	end
end
