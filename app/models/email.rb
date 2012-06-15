class Email 
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :nombre, :apellido, :organizacion, :ciudad,:telefono,:email,:mensaje,:destino,:url

  validates :nombre, :email, :mensaje, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end
