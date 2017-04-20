class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :subject
      t.text :content
      t.integer :draft_flag
      t.integer :recipient
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
