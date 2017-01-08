class Work < Sequel::Model
  many_to_one :user
  one_to_many :images
  one_to_many :technologies
  Work.plugin :association_dependencies
  Work.add_association_dependencies :technologies => :destroy
end