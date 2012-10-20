class SearchController < ApplicationController

  def index
    @results = JSON.parse(`../e2tv-api/e2tv --search #{Shellwords.escape(params[:q])}`)
  end

  def show
    @details = JSON.parse(`../e2tv-api/e2tv --details --#{params[:type]} #{params[:id]}`)
  end

end
