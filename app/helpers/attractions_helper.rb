module AttractionsHelper

  def attraction_nav(attraction)
    @attraction = attraction
    if current_user && current_user.admin?
      render partial: "attractions/admin_nav", locals: {attraction: @attraction}
    else
     render "attractions/go_on_ride"
    end
  end

  def go_or_show(attraction)
    if current_user && current_user.admin?
      link_to "Show #{attraction.name}", attraction_path(attraction)
    else
      link_to "Go on #{attraction.name}", attraction_path(attraction)
    end
  end

  def nav_if_admin(attraction)
    @attraction = attraction
    if current_user && current_user.admin?
      render partial: "attractions/admin_nav", locals: {attraction: @attraction}
    end
  end

end
