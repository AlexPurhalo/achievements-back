Sequel.migration do
  up do
    create_table :achievements do
      primary_key :id
      String :name, null: false
      foreign_key :user_id
    end
  end

  down do
    drop_table :achievements
  end
end