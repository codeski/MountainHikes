class ApplicationRecord < ActiveRecord::Base
self.abstract_class = true

  def only_tenth(display)
    if display.count == 0
        "(none)"
    elsif display.count == 2
        "#{display[0] + "." + display[1][0]}"
    else
        "#{display}"
    end
  end
  
end
