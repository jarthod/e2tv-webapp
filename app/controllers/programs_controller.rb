class ProgramsController < ApplicationController

  def index
    @torrents = Torrent::get_all
    @schedule = schedule['channels']
    @start = @schedule.map {|c| Time.parse(c['programs'].first['from']) }.sort.first
  end

  def torrent
    @torrents = Torrent::get_all
    render :partial => 'torrent', :layout => nil
  end

  def download
    Torrent::add params[:url]
    redirect_to root_path
  end

  def search
    params[:q] ||= ""
    @results = Rails.cache.fetch("search#index:#{params[:q]}") do
      JSON.parse(`../e2tv-api/e2tv --search #{Shellwords.escape(params[:q])}`)
    end
    if @results.present? and @results.any?
      result = @results.first
      type = result['type'].include?('/film/film') ? :film : :tv
      redirect_to search_path(:type => type, :id => CGI.escape(result['mid']))
    else
      redirect_to root_path
    end
  end

  def show
  end

private

  def schedule
    Rails.cache.fetch("schedule") do
      JSON.parse(`./script/pgep.py`)
    end
  end

end
