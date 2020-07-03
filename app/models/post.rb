class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories #, reject_if: :new_cat_blank?

  def new_user_blank?
    byebug
    attributes[:categories_attributes][:name].blank?
  end
end
