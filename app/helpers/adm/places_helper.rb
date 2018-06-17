module Adm::PlacesHelper

  def render_parking(i)
    case i
      when 0
        "無"
      when 1
        "有"
      when 2
        "附近有付費停車"
      when 3
        "附近有免費停車"
    end
  end
  
end
