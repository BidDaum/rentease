class UpdateImageTagsJob < ApplicationJob
  queue_as :default

  def perform(apply)
    # image_keys = rentfile.photos.map(&:key)
    # image_keys.each do |key|
    #   Cloudinary::Api.update(key, tags: [rentfile.apply_id])
    # end

    all_documents = apply.rentfiles.map(&:photos).flatten
    all_documents.each_with_index do |photo, index|
      new_key = "#{index}-#{photo.key}"
      Cloudinary::Api.update(photo.key, tags: "#{apply.id}")
      Cloudinary::Uploader.rename(photo.key, new_key, options = {overwrite: true})
      photo.blob.update(key: new_key)
    end
  end
end
