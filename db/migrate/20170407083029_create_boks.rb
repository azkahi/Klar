class CreateBoks < ActiveRecord::Migration[5.0]
  def change
    create_table :boks do |t|
      t.string :title

      t.timestamps
    end
  end
end
