module FavorsHelper

  def set_new_page_header(type)
    if type == "RequestedFavor"
      "Request a Favor"
    elsif type == "OfferedFavor"
      "Offer a Favor"
    end
  end

  def set_show_page_header(type)
    if type == "RequestedFavor"
      "You requested this favor"
    elsif type == "OfferedFavor"
      "You offered this favor"
    end
  end

  def accepted_acceptance_user_link(favor)
    # last is here because without it the relationship 
    # returns instead of the object
    ac = favor.acceptances.where(accepted: true).last
    link_to ac.user.name, user_path(ac.user)
  end

  def set_acceptances_message(type, favor)
    if !favor.has_accepted_acceptance?
      if type == "RequestedFavor"
        "The following people would like to do you this favor"
      elsif type == "OfferedFavor"
        "The following people need this favor from you"
      end
    elsif favor.has_accepted_acceptance?
      if type == "RequestedFavor"
        "The following user has agreed to do you this favor"
      elsif type == "OfferedFavor"
        "You agreed to do the following user this favor"
      end
    end 
  end
end