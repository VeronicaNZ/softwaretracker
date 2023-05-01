class User < ApplicationRecord
  has_many :user_tools, :dependent => :delete_all
  has_many :tools, through: :user_tools
  has_many :tool_categories, through: :tools
  has_many :categories, through: :tool_categories
  def fullname
    first_name+ " "+ sur_name
  end
end
