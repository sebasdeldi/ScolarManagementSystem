class AddReceiptFileToReceipt < ActiveRecord::Migration
  def change
  	add_column :receipts, :receiptFile, :string
  end
end
