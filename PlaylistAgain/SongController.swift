//
//  SongController.swift
//  PlaylistAgain
//
//  Created by Michael Castillo on 2/8/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import Foundation

class SongController {

    static let sharedController = SongController()
    
    // Adding song to our playlist
    func addSongWith(name: String, artist: String, to playlist: Playlist) {
        
        let song = Song(artist: name, title: artist)
        
        playlist.songs.append(song)
        PlaylistController.sharedController.saveToPersistentStore()
    }
    
    
    // deleting a song to our playlist
    
    func delete(song: Song, from playlist: Playlist) {
    // find the index of the song in the array of songs
        guard let index = playlist.songs.index(of: song) else { return }
        
        playlist.songs.remove(at: index)
    }
}
