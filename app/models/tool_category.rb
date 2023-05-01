class ToolCategory < ApplicationRecord
  belongs_to :tool
  belongs_to :category
end
