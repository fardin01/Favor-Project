class Permission < Struct.new(:user)

  def allow?(controller, action, obj = nil)
    if controller == "acceptances"
      if (action == 'create' || action == 'update') && obj.has_accepted_acceptance?
        return false
      end
    end
    return true 
  end
end