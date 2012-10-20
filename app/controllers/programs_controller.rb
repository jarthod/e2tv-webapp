class ProgramsController < ApplicationController

  def index
    @torrents = Torrent::get_all
  end

  def show
  end

end
