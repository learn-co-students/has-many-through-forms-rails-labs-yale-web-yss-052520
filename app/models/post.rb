class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories, reject_if: :any_blank?
  
  def any_blank?(attributes)
     attributes['name'].empty? || attributes['user_id'].empty?
  end


  def category_ids=(ids)
    ids.each do |id|
      unless id.empty? || id.nil?
      category = Category.find(id) unless id == 0
       self.categories << category
      end
    end
  end

  # def cagtegory_ids
  #   self.categories.each do |category|
  #     category = Category.id 
      
  # end

  def categories_attributes=(category_attributes)
    # byebug
    category_attributes.values.each do |category_attribute|
      unless category_attribute['name'].empty?
      category = Category.find_or_create_by(category_attribute)
      self.categories << category 
      end 
    end
  end
end