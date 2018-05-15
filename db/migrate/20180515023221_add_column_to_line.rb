class AddColumnToLine < ActiveRecord::Migration[5.2]
  def change
    add_column :lines, :route_id, :integer
  end
end
