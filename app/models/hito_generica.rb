class HitoGenerica < ActiveRecord::Base
  
      belongs_to :hito      # foreign key - post_id
  belongs_to :generica  # foreign key - category_id

end
