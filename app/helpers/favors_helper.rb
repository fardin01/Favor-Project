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

  def assigned(favor)
    favor.acceptances.any?{ |acceptance| acceptance.accepted }
  end 

  def unassigned(favor)
    favor.acceptances.none?{ |acceptance| acceptance.accepted }
  end
end