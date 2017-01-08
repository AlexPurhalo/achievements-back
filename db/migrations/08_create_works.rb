Sequel.migration do
  up do
    create_table :works do
      primary_key :id
      String :title, null: false
      Text :description, null: false
      String :link_to_code
      String :link_to_app
      String :release_date
      foreign_key :user_id
    end
  end

  down do
    drop_table :works
  end
end