class CreateMessages < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :enc_password
      t.string :access_token
    end
  end
end
