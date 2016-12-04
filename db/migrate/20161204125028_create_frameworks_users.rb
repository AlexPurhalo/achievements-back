class CreateFrameworksUsers < ActiveRecord::Migration
  def change
    create_table :frameworks_users do |t|
      t.references :framework, foreign_key: true
      t.references :user, foreing_key: true
    end
  end
end
