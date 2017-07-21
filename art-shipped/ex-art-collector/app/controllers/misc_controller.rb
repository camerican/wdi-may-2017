class MiscController < ApplicationController
  def search
    @artworks = Keyword.find_by(name: params[:t]).artworks
    render template: 'artworks/index'
  end
end