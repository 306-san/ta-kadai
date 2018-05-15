class CreateOnestrokeLines < ActiveRecord::Migration[5.2]
  def change
    create_table :onestroke_lines do |t|
      t.references :onestroke, foreign_key: true
      t.references :line, foreign_key: true

      t.timestamps
    end
  end
end
