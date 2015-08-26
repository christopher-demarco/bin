#!/usr/bin/python

from os import listdir, stat
from stat import *
from ID3 import ID3
from time import time

mp3 = '/home/cmd/mp3'

numPlaylists, numTracks = 0, 0
startTime = time()

for artist in listdir(mp3):
    thisArtist = "%s/%s" % (mp3, artist)
    if not S_ISDIR(stat(thisArtist)[ST_MODE]):continue
    for album in listdir(thisArtist):
        numTracks += 1
        thisAlbum= "%s/%s" % (thisArtist, album)
        if not S_ISDIR(stat(thisAlbum)[ST_MODE]): continue
        thisPlaylist = "%s/%s-%s.m3u" % (mp3, artist, album)
        playlist = {}
        for track in listdir(thisAlbum):
            numTracks += 1
            thisTrack = "%s/%s" % (thisAlbum, track)
            id3 = ID3(thisTrack)
            playlist[id3.track] = thisTrack
        try: del(id3)
        except NameError, e: pass
        m3u = open(thisPlaylist, "w")
        for i in range((playlist.__len__() +1))[1:]:
            try:
                m3u.write("%s\n" % playlist[i])
            except KeyError: pass
        m3u.close()

endTime = time()
runTime = endTime - startTime

print "Wrote %s playlists (%s tracks) in %s seconds." % \
      (numPlaylists, numTracks, runTime)


