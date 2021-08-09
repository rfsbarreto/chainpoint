class BadgesController < ApplicationController
  before_action :set_badge_and_node, only: %i[show]

  # GET /badges/1 or /badges/1.json
  def show; end

  # GET /badges/new
  def new
    @badge = Badge.new
  end

  # POST /badges or /badges.json
  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to success_path(id: @badge.id), flash: { notice: 'Badge was successfully created.' }
    else
      render :new, status: :unprocessable_entity, flash: { error: 'There was an error on badge creation' }
    end
  end

  private

  def set_badge_and_node
    @badge = Badge.find(params[:id])
    @node = Chainpoint::Node.build_from_badge(@badge)
  end

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def badge_params
    params.require(:badge).permit(:issue_date, :recipient_name, :badge_uuid)
  end
end
