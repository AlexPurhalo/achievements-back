class UserAchievements < Grape::API
  resources :users do
    get '/:id/achievements', rabl: 'achievements/index' do
      user = User[params[:id]]
      @achievements = user.achievements
    end

    post '/:id/achievements', rabl: 'achievements/index' do
      User[params[:id]].add_achievement(Achievement.create(name: params[:achievement]))
      @achievements = User[params[:id]].achievements
    end

    put '/:id/achievements/:id', rabl: 'achievements/index' do
      achievement_id, user_id = params[:id][1], params[:id][0]
      @achievement = Achievement[achievement_id]
      @achievement.name = params[:achievement]
      @achievement = @achievement.save
      @achievements = User[user_id].achievements
    end

    delete '/:id/achievements/:id', rabl: 'achievements/index' do
      user_id, achievement_id = params[:id][0], params[:id][1]
      user, achievement = User[user_id], Achievement[achievement_id]

      achievement.destroy

      @achievements = user.achievements
    end
  end
end