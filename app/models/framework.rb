class Framework < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates :framework, presence: true, uniqueness: true
end