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
  # IL MANQUE la génération d'url
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

def edit
  @apply = Apply.find(params[:id])
end

def update
  required_docs = ["identité", "bulletin de paie", "justificatif de domicile"]
  @apply = Apply.find(params[:id])
  @next_type = required_docs[1 - @apply.checklist]
  @apply.user = current_user
  @apply.update(apply_params)
  # @apply.assign_attributes(apply_params)
  redirect_to apply_path(@apply)
end

def finalizedapply
  @apply = Apply.find(params[:id])
  @merged_pdf = Cloudinary::Uploader.multi(@apply.id, :format => 'pdf')
end

private

  def apply_params
    params.require(:apply).permit(:id, :user_id, :checklist, :expiracy_date, :url, :title)
  end
end
