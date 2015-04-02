class StatsController < ApplicationController
  before_action :set_stat, only: [:edit, :update]
  before_action :authenticate_admin!

  # GET /stats/1/edit
  def edit
    @location = Location.find(params[:location_id])
  end


  def update
    @location = @stat.location
    respond_to do |format|
      if @stat.update(stat_params)
        format.html { redirect_to @location, notice: 'Stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stat
      @stat = Stat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stat_params
      params.require(:stat).permit(:location_id, :lat, :long, :description, :fuel, :slips, :moorings, :integer, :protection, :ltype, :cost, :protection, :pstart, :pend, :latd, :longd)
    end
end
