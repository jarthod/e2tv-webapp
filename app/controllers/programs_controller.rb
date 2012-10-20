class ProgramsController < ApplicationController

  def index
    @torrents = Torrent::get_all
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

end
