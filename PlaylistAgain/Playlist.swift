//
//  Playlist.swift
//  PlaylistAgain
//
//  Created by Michael Castillo on 2/8/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import Foundation


class Playlist: Equatable {
    
    private let songKey = "songKey"
    private let playlistTitleKey = "playlistTitleKey"

    var songs: [Song]
    let playlistTitle: String
    
    // we give it a default value so when we call it we dont have to add it later
    init(songs: [Song] = [], playlistTitle: String) {
        self.songs = songs
        self.playlistTitle = playlistTitle
    }
    // container for the food. (dictionary representation)
    var dictionaryRepresentation: [String: Any] {
        
        var songDictionaries: [[String: String]] = []
        
        for song in songs {
            let songDictionary = song.dictionaryRepresentation
            songDictionaries.append(songDictionary)
        }
        return [songKey: songDictionaries, playlistTitleKey: playlistTitle]
    }
    
    init?(dictionary: [String: Any]) {
        // this is an array of dictionaries fot the songs
        guard let name = dictionary[playlistTitleKey] as? String, let songDictionaries = dictionary[songKey] as?[[String: String]] else { return nil }
        
        // turn into instance of Song Class
        //this is the container. we give it a defualt value so we can store in it immediately
        var songs: [Song] = []
        
        for songDictionary in songDictionaries {
        
            guard let song = Song(dictionary: songDictionary) else { break }
            songs.append(song)
        }
        /////double check this self.playlist
        
        self.playlistTitle = name
        self.songs = songs
    }
    
}
//global scope function

 func ==(lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.playlistTitle == rhs.playlistTitle &&
            lhs.songs == rhs.songs
    }
