class Framework < Sequel::Model
  many_to_many :users, left_key: :framework_id, right_key: :user_id, join_table: :frameworks_users
end