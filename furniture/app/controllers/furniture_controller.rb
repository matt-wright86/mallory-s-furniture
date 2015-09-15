require 'csv'

class FurnitureController < ApplicationController

  def list
    @furnitures = furn.sort_by(& :pid)

 @furnitures.reject {|f| f.quantity == 0 }
end

def index
   @furnitures = Furniture.all.paginate(page: params[:page], per_page: 10)
 end


  def details
    @furnitures = furn
    @furniture = @furnitures.find {|f| f.pid == params[:pid]}

  end



  def furn
    @furnitures = []

    CSV.foreach(Rails.root + "data/mf_inventory.csv", headers: true) do |row|



      furniture = FurnitureItem.new
      furniture.pid = row.to_h["pid"]
      furniture.item = row.to_h["item"]
      furniture.description = row.to_h["description"]
      furniture.price = row.to_h["price"]
      furniture.condition = row.to_h["condition"]
      furniture.dimension_w = row.to_h["dimension_w"]
      furniture.dimension_l = row.to_h["dimension_l"]
      furniture.dimension_h = row.to_h["dimension_h"]
      furniture.img_file = row.to_h["img_file"]

      if row.to_h["quantity"].to_i > 0
      furniture.quantity = row.to_h["quantity"]

      furniture.category = row.to_h["category"]



      @furnitures << furniture
      end
    end
    @furnitures
  end

end
