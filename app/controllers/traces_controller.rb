class TracesController < ApplicationController
  before_action :set_trace, only: [:show, :edit, :update, :destroy]

  # GET /traces
  # GET /traces.json
  def index
    @traces = Trace.all
  end

  # GET /traces/new
  def new
    @trace = Trace.new
  end

  def parse_form
    trace_data = trace_params
    u_date = trace_data.pop["u_date"]

    trace_data.each do |trace_data|
      trace_data[:u_date] = u_date
      found_trace = Trace.find_by(item_id: trace_data[:item_id], u_date: trace_data[:u_date])
      if found_trace
        update(found_trace, trace_data)
      else
        create(trace_data)
      end
    end
    redirect_to '/'
  end

  # POST /traces
  # POST /traces.json
  def create(trace_data)
    trace = Trace.new(trace_data)
    if trace.save
      flash[:notice] = "yay!!!"
    else
      flash[:error] = "boooo"
    end
  end

  # PATCH/PUT /traces/1
  # PATCH/PUT /traces/1.json
  def update(found_trace, trace_data) 
    if found_trace.update(trace_data)
      flash[:notice] = 'Trace was successfully updated.'
    else
      flash[:error] = 'There was a cock up.'
    end

  end

  # DELETE /traces/1
  # DELETE /traces/1.json
  def destroy
    @trace.destroy
    respond_to do |format|
      format.html { redirect_to traces_url, notice: 'Trace was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trace
      @trace = Trace.find(params[:id])
    end

    def trace_params
    # Never trust parameters from the scary internet, only allow the white list through.
      fucking_fiddly_annoying_params = params[:trace].each { |trace| trace.permit! }
      u_date = params.permit(:u_date)
      fucking_fiddly_annoying_params << u_date
    end

end
