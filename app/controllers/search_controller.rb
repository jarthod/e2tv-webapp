class SearchController < ApplicationController

  def index
    @results = JSON.parse(`../e2tv-api/e2tv --search #{Shellwords.escape(params[:q])}`)
  end

  def show
    @details = Rails.cache.fetch("search#show:details:#{params[:type]}:#{params[:id]}") do
      JSON.parse(`../e2tv-api/e2tv --details --#{params[:type]} #{params[:id]}`)
    end
    @sources = Rails.cache.fetch("search#show:sources:#{params[:type]}:#{params[:id]}") do
      JSON.parse(`../e2tv-api/e2tv --sources --#{params[:type]} #{params[:id]}`)
    end
    @image = (@details['/common/topic/image'].first || {})['id']
    @trailer = @sources.select {|s| s['kind'] == 'Trailer'}.first
    @rental = @sources.select {|s| s['kind'] == 'Rental'}.first
    @streaming = @sources.select {|s| s['kind'] == 'Streaming'}.first
    @torrents = @sources.select {|s| s['kind'] == 'Torrent'}
  end

end
