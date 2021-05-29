class AppliesController < ApplicationController


def index
    @applies = policy_scope(Apply).order(id: :desc)
end

def new
    @apply = Apply.new
end

def create
  # IL MANQUE la génération d'url et l'ajout des fichiers
  @apply = Apply.new(apply_params)
  @apply.user = current_user
  authorize(@apply)

  if @apply.save
      redirect_to apply_path(@apply)
  else
      render "new"
  end
end

private

  def apply_params
    params.require(:apply).permit(:id, :user_id, :checklist, :expiracy_date, :url)
  end

end