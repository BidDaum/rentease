class UpdateImageTagsJob < ApplicationJob
  queue_as :default

  def perform(apply)
    # image_keys = rentfile.photos.map(&:key)
    # image_keys.each do |key|
    #   Cloudinary::Api.update(key, tags: [rentfile.apply_id])
    # end

    all_image_keys = apply.rentfiles.map(&:photos).flatten.map(&:key)
    all_image_keys.each_with_index do |key, index|
      Cloudinary::Api.update(key, tags: "TEST#{apply.id}")
      Cloudinary::Uploader.rename(key, "#{index}-#{key}", options = {overwrite: true})
    end
  end
end
