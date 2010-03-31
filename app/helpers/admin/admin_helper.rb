module Admin::AdminHelper
  
  def constant_to_select(array)
    array.collect {|e| [e, array.index(e)]}
  end
  
  def setup_item(item)
    returning(item) do |p|
      p.photos.build if p.photos.empty?
      p.availabilities.build if p.availabilities.empty?
    end
  end  
  
  
end
