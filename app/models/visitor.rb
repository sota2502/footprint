class Visitor < ActiveRecord::Base
  def me
    User.find(visitor_id)
  end
end
