class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.integer :previous
      t.integer :next

      t.timestamps
    end
  end
end
