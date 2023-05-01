class Tool < ApplicationRecord
  has_many :user_tools
  has_many :tool_categories
  has_many :users, through: :user_tools
  has_many :categories, through: :tool_categories
end
