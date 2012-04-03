class Label < ActiveRecord::Base
  belongs_to :label
  has_many :labels
end
