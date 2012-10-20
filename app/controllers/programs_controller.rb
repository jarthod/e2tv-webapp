class ProgramsController < ApplicationController

  def index
  end

  def show
  end

  def search
    @results = JSON.parse(`../e2tv-api/e2tv --search #{Shellwords.escape(params[:q])}`)
  end

end
