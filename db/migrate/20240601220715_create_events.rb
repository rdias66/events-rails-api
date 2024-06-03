class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :events, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
