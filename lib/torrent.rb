module Torrent
  def self.init(ip, port = nil, path = nil)
  	Transmission.configuration.ip = ip
  	Transmission.configuration.port = port if port
  end

  def self.get_all
  	Transmission.torrents
  end

  def self.get_file(torrent)
  	torrent.files.sort {|f| f['length']}.last
  end

  def self.add(magnet)
	Transmission::RPC::Torrent.add :url => magnet
  end
end
