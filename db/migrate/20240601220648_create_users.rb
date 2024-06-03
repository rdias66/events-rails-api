class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :users, id: :uuid do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :usertype
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
