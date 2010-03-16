module Admin::AdminHelper
  
  def constant_to_select(array)
    array.collect {|e| [e, array.index(e)]}
  end
  
  
end
