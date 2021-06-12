class RentfilesController < ApplicationController

  def new
    @apply = Apply.find(params[:apply_id])
    redirect_to new_apply_rentfile_path(@apply, optional: "true") if params[:count].to_i > Rentfile::MANDATORY_RENTFILES.size - 1
    if params[:optional] == "true"
      @type = Rentfile::OPTIONAL_RENTFILES
    elsif params[:count].to_i == 0
      @type = Rentfile::MANDATORY_RENTFILES.first
    elsif params[:count].to_i > 0 && params[:count].to_i <= Rentfile::MANDATORY_RENTFILES.size - 1
      @type = Rentfile::MANDATORY_RENTFILES[params[:count].to_i]
    end
    @rentfile = Rentfile.new
  end

  def create
    @rentfile = Rentfile.new(rentfile_params)
    @apply = Apply.find(params[:apply_id])
    @rentfile.apply_id = @apply.id
    @apply.count += 1
    if @rentfile.save && @apply.save
      flash[:notice] = "It worked!"
      redirect_to new_apply_rentfile_path(@apply, count: @apply.count)
    else
      render "new"
    end
  end

  def update
    rentfile = Rentfile.find(params[:id])
    rentfile.update(rentfile_params)
    apply = rentfile.apply
    redirect_to apply_path(apply)

  end

private
  def rentfile_params
    params.require(:rentfile).permit(:apply_id, :name, photos: [])
  end
end
