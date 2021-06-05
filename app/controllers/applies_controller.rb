class AppliesController < ApplicationController


def index
    @applies = Apply.all
end

def new
    @apply = Apply.new
end

def show
  @apply = Apply.find(params[:id])
end

def create
  # IL MANQUE la génération d'url et l'ajout des fichiers
  @apply = Apply.new(apply_params)
  @apply.user = current_user
  required_docs = ["identité", "bulletin de paie", "justificatif de domicile"]
  @next_type = required_docs[1 - @apply.checklist] # itération sur l'array des documents requis

  if @apply.save
      redirect_to new_apply_rentfile_path(@apply)
  else
      render "new"
  end
end

def destroy
  @apply = Apply.find(params[:id])
  @apply.destroy
  redirect_to applies_path
end

private

  def apply_params
    params.require(:apply).permit(:id, :user_id, :checklist, :expiracy_date, :url)
  end

end