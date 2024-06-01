class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :category
      t.string :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
