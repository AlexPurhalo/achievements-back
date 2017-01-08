collection @works

attributes :id, :title, :description, :link_to_app, :link_to_code, :release_date

child :images do |image|
    attributes :id, :image
end

child :technologies do |technology|
    attributes :id, :name
end