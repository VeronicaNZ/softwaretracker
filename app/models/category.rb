class Category < ApplicationRecord
  has_many :tool_categories
  has_many :tools,  through: :tool_categories

end
