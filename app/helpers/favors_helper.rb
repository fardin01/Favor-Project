module FavorsHelper

  def set_header(type)
    if type == "RequestedFavor"
      "Request a Favor"
    elsif type == "OfferedFavor"
      "Offer a Favor"
    end
  end

end