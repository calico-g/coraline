class GraphGetter

  def get_data_by_type(type)
    @items = Item.where("item_type = ?", type)
    get_data
  end

  def get_data_by_item(item)
    @items = Item.where("name = ?", item)
    get_data
  end

  def get_data
    series = []
    @items.each do |item|
      item_hash = { name: item.name, data: [] }
      traces = item.traces
      traces.each do |trace|
        trace_array = []
        trace_array[0] = trace.u_date.to_datetime.to_i*1000
        trace_array[1] = trace.input
        item_hash[:data] << trace_array
      end
      item_hash[:data].sort!
      series << item_hash
    end
    series
  end

end