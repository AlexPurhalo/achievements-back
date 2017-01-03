Sequel.migration do
  change do
    create_table :frameworks_users do
      primary_key :id
      foreign_key :user_id, :users
      foreign_key :framework_id, :frameworks
    end
  end
end

# framework = Framework.create(name: 'Grape')
# user = User.create(username: 'AlexP', decrypted_password: '$2a$10$wJWNvkkeFdKedov9BKKGrOx7JrkRtbNAlgkSCt9zkozSSqL7nUV42')
# user.add_framework(framework)
# user_frameworks = user.frameworks_dataset