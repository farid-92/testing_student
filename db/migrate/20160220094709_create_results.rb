class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :student
      t.string :correct

      t.timestamps null: false
    end
  end
end
