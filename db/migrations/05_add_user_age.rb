Sequel.migration do
  up do
    add_column :users, :age, Integer
  end

  down do
    drop_column :users, :age
  end
end