class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.nausea && self.happiness
      if self.nausea.to_i > self.happiness.to_i
        "sad"
      elsif self.nausea.to_i < self.happiness.to_i
        "happy"
      else
        "neutral"
      end
    else
      "neutral"
    end
  end

  def num_of_rides
    self.attractions.count
  end
end
