Sequel.migration do
  up do
    create_table :images do
      primary_key :id
      String :image, null: false
      foreign_key :work_id
    end
  end

  down do
    drop_table :images
  end
end