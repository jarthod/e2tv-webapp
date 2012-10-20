def init(url, port, path=None)
	Transmission.configuration.ip = ip
	Transmission.configuration.port = port
end

def get_torrents()
	Transmission.torrents
end

def get_file(torrent_id)
	Transmission.torrents.find {|f| f.id == 3} .files.sort {|f| f['length']}.last
end
