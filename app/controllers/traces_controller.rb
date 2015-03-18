class TracesController < ApplicationController
  before_action :set_trace, only: [:show, :edit, :update, :destroy]

  # GET /traces
  # GET /traces.json
  def index
    @traces = Trace.all
  end

  # GET /traces/1
  # GET /traces/1.json
  def show
  end

  # GET /traces/new
  def new
    @trace = Trace.new
  end

  # GET /traces/1/edit
  def edit
  end

  # POST /traces
  # POST /traces.json
  def create
    @trace = Trace.new(trace_params)

    respond_to do |format|
      if @trace.save
        format.html { redirect_to @trace, notice: 'Trace was successfully created.' }
        format.json { render :show, status: :created, location: @trace }
      else
        format.html { render :new }
        format.json { render json: @trace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traces/1
  # PATCH/PUT /traces/1.json
  def update
    respond_to do |format|
      if @trace.update(trace_params)
        format.html { redirect_to @trace, notice: 'Trace was successfully updated.' }
        format.json { render :show, status: :ok, location: @trace }
      else
        format.html { render :edit }
        format.json { render json: @trace.errors, status: :unprocessable_entity }
      end
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def trace_params
      params.require(:trace).permit(:item_id, :input, :notes)
    end
end
