class ProgramsController < ApplicationController

  def index
    @torrents = Torrent::get_all
    @schedule = schedule['channels']
    puts @schedule.first.inspect
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

  def show
  end

private

  def schedule
  #  Rails.cache.delete("schedule")
    Rails.cache.fetch("schedule") do
      JSON.parse(`./script/pgep.py`)
    end
  end

end
