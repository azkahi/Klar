class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.text :writer_name
      t.references :writer, foreign_key: true

      t.timestamps
    end
  end
end