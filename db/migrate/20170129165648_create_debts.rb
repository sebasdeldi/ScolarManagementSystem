class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.string :date
      t.string :description

      t.timestamps null: false
    end
  end
end
