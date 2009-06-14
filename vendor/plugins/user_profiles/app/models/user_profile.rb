class UserProfile < ActiveRecord::Base
  belongs_to :user
  
  def name
    [self.first_name, self.last_name].join(" ")
  end
  
  def name=(value)
    n = value.split(" ")
    self.first_name = n.first
    self.last_name = n.last
  end
  
end
