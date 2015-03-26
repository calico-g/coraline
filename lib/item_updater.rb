class ItemUpdater
  def initialize(items)
     @items = items
  end

  def update_item
    @items.each do |item|
    	puts "***********"
    	puts item
    	puts item.name
    	puts item.trace.input

      # item.update_attributes(input: 12)
      item.save
    end
  end
end