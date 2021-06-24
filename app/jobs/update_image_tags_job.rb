class UpdateImageTagsJob < ApplicationJob
  queue_as :default

  def perform(apply)
    # image_keys = rentfile.photos.map(&:key)
    # image_keys.each do |key|
    #   Cloudinary::Api.update(key, tags: [rentfile.apply_id])
    # end

    all_documents = apply.rentfiles.map(&:photos).flatten
    all_documents.each_with_index do |doc, index|
      new_key = "#{index}-#{doc.key}"
      Cloudinary::Api.update(doc.key, tags: "#{apply.id}")
      Cloudinary::Uploader.rename(doc.key, new_key, options = {overwrite: true})
      doc.blob.update(key: new_key)
    end
  end
end
