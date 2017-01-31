class CreateMailshots < ActiveRecord::Migration
  def change
    create_table :mailshots do |t|
      t.string :body
      t.string :grade
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
