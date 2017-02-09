//
//  PlaylistController.swift
//  PlaylistAgain
//
//  Created by Michael Castillo on 2/8/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import Foundation


class PlaylistController {

    static let sharedController = PlaylistController()
    
    private let playlistsKey = "playlistsKey"
    
    //Create
    
        // this name will be whatever the user types into the texfield
    func addPlaylist(name: String) {
        // Make a playlist and put it in our collection of playlists to be displayed for the user.   
        // same thing as Playlist(playlistTitle: name, song: []) default value
        let playlist = Playlist(playlistTitle: name)
        playlists.append(playlist)
        saveToPersistentStore()
    }
    //Read
    init() {
        loadFromPersistentStore()
    }
    
    //all of the food on the table
    private(set) var playlists: [Playlist] = []
   
    //Update
    
    //Delete
    func delete(playlist: Playlist) {
        // we need to get the index of that playlist that we pass into the array in order to delete the right playlist
        guard let index = playlists.index(of: playlist) else { return }
        playlists.remove(at: index)
        saveToPersistentStore()
        
    }
    // savingj - putting the container of food in the fridge for safe keeping until we want to take it out and eat it
    //Persistence - 2nd day add on
    func saveToPersistentStore() {
        
        var playlistDictionaries: [[String: Any]] = []
        
        for playlist in playlists {
            // calling computed property
            let playlistDictionary = playlist.dictionaryRepresentation
            
            playlistDictionaries.append(playlistDictionary)
            
        }
        
        UserDefaults.standard.set( playlistDictionaries, forKey: playlistsKey)
    }
    
    func loadFromPersistentStore() {
        guard let playlistDictionaries = UserDefaults.standard.value(forKey: playlistsKey) as? [[String: Any]]
            else { return }
        // go and make your failable initalizer
        var playlists: [Playlist] = []
        
        for playlistDictionary in playlistDictionaries {
            guard let playlist = Playlist(dictionary: playlistDictionary) else { break }
            
            playlists.append(playlist)
            //create or make.... think initializer
        }
        self.playlists = playlists
    }
}
