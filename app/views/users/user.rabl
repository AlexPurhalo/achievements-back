collection @user
attributes :username, :id, :profile, :skills, :name, :age, :email, :years, :country, :city, :phone
node(:avatar) { |m| User.find(params[:id]).avatar.url }
child :frameworks do |framework|
    attributes :framework
end

