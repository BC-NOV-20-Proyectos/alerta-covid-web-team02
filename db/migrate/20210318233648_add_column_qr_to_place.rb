class AddColumnQrToPlace < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :qr_image, :string
  end
end
