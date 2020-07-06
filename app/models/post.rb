class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories 


  # Custom setter method allows you to insert your own 
  # logic into the method rails is generating for 
  # you with accepts_nested_attrbutes_for. 
  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attribute["name"].present?
        category = Category.find_or_create_by(category_attribute)
        self.categories << category 
      end 
    end 
  end 
end
