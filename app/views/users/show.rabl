object @user
attributes :id, :username, :profile, :skills, :name, :age, :email, :country, :city, :phone
node(:avatar) { |m| @user.avatar.url }
child :frameworks do |framework|
    attributes :name
end