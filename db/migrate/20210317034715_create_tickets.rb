class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :branch_name

      t.timestamps
    end
  end
end
