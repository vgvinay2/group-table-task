class CreateSecretCodes < ActiveRecord::Migration
  def change
    create_table :secret_codes do |t|
      t.string :secret_key
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
