require 'timeout'

module Torrent
  def self.init(ip, port = nil, path = nil)
  	Transmission.configuration.ip = ip
  	Transmission.configuration.port = port if port
  end

  def self.get_all
    Timeout::timeout(3) {
    	Transmission.torrents
    }
  rescue
    []
  end

  def self.get_file(torrent)
  	torrent.files.sort {|f| f['length']}.last
  end

  def self.add(magnet)
	  Transmission::RPC::Torrent.add :url => magnet
  end
end
