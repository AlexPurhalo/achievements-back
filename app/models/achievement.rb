class Achievement < Sequel::Model
  many_to_one :user
end