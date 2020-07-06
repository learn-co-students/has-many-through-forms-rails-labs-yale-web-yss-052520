class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

    # THIS LINE IS KEY FOR THE NESTED FORMS TO WORK IN RAILS!!
    accepts_nested_attributes_for :user

    def user_attributes=(user_attributes)
      self.user = User.find_or_create_by(username: user_attributes[:username]) unless user_attributes[:username].blank?
    end

end
