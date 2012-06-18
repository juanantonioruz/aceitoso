class Medio < ActiveRecord::Base
      belongs_to :museo


 def esvideo
    if self.es_audio
        'No'
    else
        'Si'
    end
  end
end
