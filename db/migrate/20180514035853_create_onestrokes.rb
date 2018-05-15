class CreateOnestrokes < ActiveRecord::Migration[5.2]
  def change
    create_table :onestrokes do |t|

      t.timestamps
    end
  end
end
