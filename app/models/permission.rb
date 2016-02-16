class Permission 
  def initialize(user)
    allow :site, :index
    allow :users, [:new, :create, :show]
    allow :sessions, [:new, :create, :destroy]
    allow :favors, [:index]
    allow :rewards, [:show]
    if user
      allow :favors, [:show] do |favor|
        if favor.has_accepted_acceptance?
          favor.user_id == user.id || favor.acceptor_user.id == user.id
        else
          allow_all
        end
      end
      allow :users, [:edit, :update] do |usr|
        usr.id == user.id
      end
      allow :favors, [:new, :create]
      allow :favors, [:edit, :update, :destroy] do |favor|
        favor.user_id == user.id
      end
      allow :acceptances, [:create, :update] do |favor|
        !favor.has_accepted_acceptance?
      end
      allow :activities, [:index]
    end
  end

  def allow?(controller, action, resource = nil)
    allowed = @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end
  
  def allow_all
    @allow_all = true
  end
  
  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end
end