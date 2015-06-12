class ChartsController < ApplicationController

  def index
    gon.number_series = get_data("number")
    gon.scale_series = get_data("scale")
    gon.boolean_series = get_data("boolean")
  end

  private

  def get_data(type)
    series = []

    items = Item.where("item_type = ?", type)
    items.each do |item|
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