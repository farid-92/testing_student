class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :name
      t.string :surname
      t.string :group
      t.string :total_point
      t.references :test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
