module MaterialesHelper
  
  def is_need_hidden(condition)
    (if condition
      "hidden"
    else
      ""
    end).html_safe
  end
  
end
