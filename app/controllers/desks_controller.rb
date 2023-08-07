class DesksController < ApplicationController
  before_action :set_desk, only: %i[edit update]

  def edit
  end

  def update
    if @desk.update(desk_params)
      redirect_to desks_report_user_reports_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_desk
    @desk = Desk.find(params[:id])
  end

  def desk_params
    params.require(:desk).permit(:type, :price, :capacity)
  end

end
