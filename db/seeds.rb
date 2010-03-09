# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


Category.destroy_all
Item.destroy_all
Page.destroy_all
Brand.destroy_all

Page.populate(4) do |page|
  
  page.title = Populator.words(1..3).capitalize
  page.body  = Populator.paragraphs(2..3)  
  page.public = true
    
end


Brand.populate(5) do |brand|
  
  brand.title = Populator.words(1..3).capitalize
  brand.body  = Populator.paragraphs(2..3)  
  brand.public = true
  
end

brands = Brand.all.collect {|b| b.id}


Category.populate(2) do |category|
  
  category.title = Populator.words(1..3).capitalize
  category.permalink = category.title.gsub(" ", "-").downcase
  category.public = true
  
  Item.populate(10..15) do |item|
    item.category_id = category.id
    item.title = Populator.words(1..3).capitalize
    item.body  = Populator.paragraphs(1..2)
    item.price = 100 + rand(200)
    item.public = true
    item.brand_id = brands
    item.status = [0,1,2]
    
    ItemAvailability.populate(1..3) do |avail|
      avail.item_id = item.id      
      avail.size = [0,1,2,3]
      avail.quantity = rand(5)
    end
    
  end
  
end




  def make_image_source(source, format)
    idx = 0
    lambda do |item|
      Dir.chdir(File.join(RAILS_ROOT, "public", source)) 
      paths = Dir["*.#{format}"]
      item.image = File.new(paths.sort_by{rand}.first)
      item.image.reprocess!
      idx+= 1 if item.save
      idx = 0 if idx >= paths.size      
    end 
  end
  
  image_maker = make_image_source("test-images", "png")
  brand_maker = make_image_source("test-brands", "jpg")
  
  brands = Brand.all
  brands.each do |brand|
    brand_maker.call(brand)
  end

    
  items = Item.all
  items.each do |item|
    item.color_list = (%[белый черный красный желтый зеленый синий коричневый]).sort_by{ rand }.first      
    image_maker.call(item)  
  end  