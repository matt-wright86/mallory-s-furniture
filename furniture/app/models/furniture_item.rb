class FurnitureItem

  attr_accessor :pid, :item, :description, :price, :condition, :dimension_w,
  :dimension_l, :dimension_h, :img_file, :quantity, :category



  def disc
    if @condition == "good"
      @p2 = @price.to_i - @price.to_i * 0.10
      "Clearance price: $#{@p2} (10% off)"
   elsif @condition == "average"
      @p3 = @price.to_i - @price.to_i * 0.20
      "Clearance price: $#{@p3} (20% off)"
   else ""
    end
  end

  def ldisc
    if @condition == "good"
      "clearance item #{@p2}"
    elsif @condition == "average"
      "clearance item #{@p3}"
    else ""
    end
  end


end
