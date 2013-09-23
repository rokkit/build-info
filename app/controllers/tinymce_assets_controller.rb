class TinymceAssetsController < ApplicationController
  def create
    name = params[:file].original_filename
    directory = "public/images/articles"
    path = File.join(directory, name)
    image = File.open(path, "wb") { |f| f.write(params[:file].read) }
    p image
    render json: {
          image: {
            url: "/images/articles/#{name}"
          }
        }, content_type: "text/html"
  end
end
