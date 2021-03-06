class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index

    @item = Item.new
    @items = Item.all
    @date = params[:u_date] || Time.now.strftime("%Y-%m-%d")
    @form_items = {}

    @items.each do |item|
      todays_trace = Trace.find_by(item_id: item.id, u_date: @date)
      if todays_trace
        @form_items[item] = todays_trace
      else
        @form_items[item] = Trace.new({input: "", notes: ""})
      end
    end

  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to '/', notice: 'Item was successfully created.' }
      else
        format.html { redirect_to '/', alert: @item.errors.full_messages }
      end
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])
    gg = GraphGetter.new
    gon.item_series = gg.get_data_by_item(@item.name)
    gon.chart_type = "column" if @item.item_type == "boolean" else "line"
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :item_type, :trace)
    end
end
