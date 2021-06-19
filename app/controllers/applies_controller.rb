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
  apply = Apply.new(apply_params)
  apply.user = current_user
  required_docs = ["identité", "bulletin de paie", "justificatif de domicile"]
  next_type = required_docs[1 - apply.checklist] # itération sur l'array des documents requis

  if apply.save
    rentfile = Rentfile.create(apply: apply, name: "cover_page_#{apply.id}")
    CoverPageJob.perform_now(apply, rentfile)
    redirect_to new_apply_rentfile_path(apply)
  # Il faut générer un pdf via WickedPdf avec un render to string. Puis le ratacher à un rentfile
  # qui est lui même attaché à un rentfile
  # rentfile.create --> rentfile.photos.attached (seulement si apply.save = true)
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

def finalized_apply
  @apply = Apply.find(params[:id])
  # UpdateImageTagsJob.perform_now(@apply)
  @merged_pdf = Cloudinary::Uploader.multi(@apply.id, :format => 'pdf')
end

def cover_page
  @apply = Apply.find(params[:id])
  @user = User.where(user_id: @apply.user_id)
end

def share
  raise
  # Get apply id
  # Call mailer with email in params
  UserMailer.with(apply_id: "", email: "").simple_message.deliver_later
end

private

  def apply_params
    params.require(:apply).permit(:id, :user_id, :checklist, :expiracy_date, :url, :title, :email)
  end
end
