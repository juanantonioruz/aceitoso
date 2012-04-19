class CaminoGenerica < ActiveRecord::Base
  
      belongs_to :camino      # foreign key - post_id
  belongs_to :generica  # foreign key - category_id

end
