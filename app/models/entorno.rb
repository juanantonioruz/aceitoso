class Entorno < ActiveRecord::Base
  belongs_to :museo
  has_many :hitos
  has_many :urbanos
  has_many :caminos
end
