class CreateMessages < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :enc_password
      t.string :access_token
      t.string :profile
      t.string :skills
      t.string :email
      t.string :name
      t.string :mobile
      t.string :avatar
      t.integer :age
      t.string :city
      t.string :linkedin
      t.string :github
      t.string :skype
      t.string :vk
      t.string :twitter
      t.string :facebook
    end
  end
end
