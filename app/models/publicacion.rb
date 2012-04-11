class Publicacion < ActiveRecord::Base
  belongs_to :museo
  has_and_belongs_to_many :labels,:join_table=>'publicacions_labels'

  before_validation :smart_add_url_protocol



    def smart_add_url_protocol
        unless self.url.include?("http://")
          self.url = 'http://' + self.url
        end
    end

    def enlace
        if self.url==''
            return ' '
        else
            return self.url
        end
    end
end
