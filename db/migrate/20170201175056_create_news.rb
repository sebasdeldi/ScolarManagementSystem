class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :body
      t.string :title
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
