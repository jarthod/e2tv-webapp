#!/usr/bin/env python
import json, urllib2, sys, datetime
from pprint import pprint

channels_id = {u"TF1": "4f7f1215bb9478733800a2f2",
               u"France 2": "4f7f109cbb94787338000141",
               u"France 3": "4f7f10f4bb94787338003171",
               u"France 4": "4f7f10fdbb94787338003766",
               u"France 5": "4f7f1114bb94787338004142",
               u"France O": "4f7f10c9bb94787338001bae",
               u"Canal+": "4f7f10aabb94787338000b99",
               u"Arte": "4f7f10a2bb94787338000506",
               u"M6": "4f7f115abb947873380064a1",
               u"W9": "4f7f123ebb9478733800b4f7",
               u"NRJ 12": "4f7f119abb94787338007b33",
               u"NT 1": "4f7f11a4bb94787338008092",
               u"TMC": "4f7f122bbb9478733800ae38",
               u"Gulli": "4f7f1130bb94787338004f17",
               u"D8": "4f7f10babb94787338001398",
               u"BFM TV": "4f7f10a6bb9478733800073f"}

def get_json(url):
    u = urllib2.urlopen(url)
    return json.load(u)

def get_channel_prog(chan_id):
    _from = datetime.datetime.now() - datetime.timedelta(hours=2)
    _from = _from.isoformat()
    to = datetime.datetime.now() + datetime.timedelta(hours=2)
    to = to.isoformat()
    url = "http://pgep.francetv.fr/broadcasts/?filters=channel:%s&format=json&from=%s&to=%s" % (chan_id, _from, to)
    return get_json(url)


if __name__ == '__main__':
    res = {'channels': []}
    for k, v in channels_id.iteritems():
        chan = {"name": k, "programs": []}
        data = get_channel_prog(v)
        for i in data['results']:
            prog = {}
            prog['from'] = str(datetime.datetime.strptime(i['starts_at'], "%Y-%m-%dT%H:%M:00+02:00"))
            prog['to']   = str(datetime.datetime.strptime(i['ends_at'], "%Y-%m-%dT%H:%M:00+02:00"))
            prog['name'] = i['title']
            prog['photos'] = i['program']['photo']
            prog['pluzz'] = i['program']['_providers']['pluzz']['replay_url'] if 'pluzz' in i['program']['_providers'] else None
            chan['programs'].append(prog)
        res['channels'].append(chan)
    pprint(res)
