class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user

  def user_attributes=(attr)
    self.user = User.find_or_create_by(username: attr[:username]) unless attr[:username].blank?
  end
end
