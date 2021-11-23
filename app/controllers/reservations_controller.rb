class ReservationsController < ApplicationController

  def create
    @court = Court.find(params[:court_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.court = @court
    if @reservation.save!
      redirect_to court_path(@court)
    else
      redirect_to courts_path
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date)
  end


end
