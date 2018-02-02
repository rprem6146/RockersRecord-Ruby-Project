module ApplicationHelper
  
  def get_last_artist
    Artist.order("created_at").last
  end 
  
end
