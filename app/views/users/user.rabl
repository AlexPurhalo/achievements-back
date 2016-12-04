collection @user
attributes :username, :id, :profile, :skills
child :frameworks do |framework|
    attributes :framework
end

