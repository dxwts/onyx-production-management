module MaterialesHelper
  
  def is_need_hidden(condition)
    (if condition
      "hidden"
    else
      ""
    end).html_safe
  end
  
  def materiale_pic_width_for_size(size)
    case size
      when :small then 24
      when :big then 120
      else size
    end
  end
  
  def materiale_pic_size_name_for_2x(size)
    case size
    when :small then :normal
    when :big then :big
    else size
    end
  end

  def materiale_pic_tag(materiale, size = :big, opts = {})
    link = opts[:link]
    images = []

    width = materiale_pic_width_for_size(size)

    if !materiale.materiale_pics?
      img_src = "holder.js/120x120"
      img = image_tag(img_src, :class => "uface", :style => "width:#{width}px;height:#{width}px;")
      image = img
    else
      materiale.materiale_pics.each do |materiale_pic|
       img = image_tag(materiale_pic.materiale_pic.url(materiale_pic_size_name_for_2x(size)), :style => "width:#{width}px;")
        if link
          image = %(<a href="">#{img}</a>)
        else
          image = img
        end
      end
    end
    images.push image
  end
  
end
