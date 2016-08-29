class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride
    if too_expensive && too_short
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif too_expensive
      "Sorry. You do not have enough tickets the #{self.attraction.name}."
    elsif too_short
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      self.user.tickets -= self.attraction.tickets
      self.user.happiness += self.attraction.happiness_rating
      self.user.nausea = self.user.nausea + self.attraction.nausea_rating
      self.user.save
      "Thanks for riding the #{self.attraction.name}!"
    end
  end




  def too_short
    self.attraction.min_height > self.user.height
  end

  def too_expensive
    self.attraction.tickets > self.user.tickets
  end

end
