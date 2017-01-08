Sequel.migration do
  up do
    create_table :technologies do
      primary_key :id
      String :name, null: false
      foreign_key :work_id
    end
  end

  down do
    drop_table :technologies
  end
end