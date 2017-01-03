Sequel.migration do
  up do
    add_column :users, :country, String
  end

  down do
    drop_column :users, :country
  end
end