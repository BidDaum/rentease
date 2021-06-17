class CoverPageJob < ApplicationJob

  def perform(apply, rentfile)
    pdf = ActionController::Base.new.render_to_string(pdf: rentfile.name, layout: false, page_size: 'A4', template: 'applies/cover_page', locals: { cover: apply })
    rentfile.photos.attach(io: StringIO.new(pdf), filename: rentfile.name, content_type: 'application/pdf')
  end
end
