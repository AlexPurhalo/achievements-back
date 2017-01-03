Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      String :username, null: false
      String :password, null: false
      String :access_token
      String :profile
      String :skills
      String :email
      String :name
      String :avatar
      String :city
    end
  end
end