class PiezaGenerica < ActiveRecord::Base
  
    belongs_to :pieza      # foreign key - post_id
  belongs_to :generica  # foreign key - category_id

end
