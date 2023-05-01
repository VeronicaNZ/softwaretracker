class UserTool < ApplicationRecord
  belongs_to :user
  belongs_to :tool
  has_many :tool_categories, through: :tool
  has_many :categories, through: :tool_categories
end