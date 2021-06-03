class RentfilesController < ApplicationController

  def new
    @rentfile = Rentfile.new
    @apply = Apply.find(params[:apply_id])
  end

  def create
    @rentfile = Rentfile.new(rentfile_params)
    @apply = Apply.find(params[:apply_id])
    @rentfile.apply_id = @apply.id
    if @rentfile.save
      flash[:notice] = "It worked!"
      redirect_to new_apply_rentfile_path(@apply)
    else
      render "new"
    end
  end

private
  def rentfile_params
    params.require(:rentfile).permit(:name, photos: [] )
  end
end
