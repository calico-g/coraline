class ChartsController < ApplicationController

  def index
    gg = GraphGetter.new
    gon.number_series = gg.get_data_by_type("number")
    gon.scale_series = gg.get_data_by_type("scale")
    gon.boolean_series = gg.get_data_by_type("boolean")
  end

end