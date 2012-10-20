module Torrent
  def self.init(ip, port = nil, path = nil)
  	Transmission.configuration.ip = ip
  	Transmission.configuration.port = port if port
  end

  def self.get_all
  	Transmission.torrents
  end

  def self.get_file(torrent_id)
  	Transmission.torrents.find {|f| f.id == 3} .files.sort {|f| f['length']}.last
  end
end