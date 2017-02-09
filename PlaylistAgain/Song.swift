//
//  Song.swift
//  PlaylistAgain
//
//  Created by Michael Castillo on 2/8/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import Foundation

class Song: Equatable {
    
    private let nameKey = "nameKey"
    private let artistKey = "artistKey"
    
    let artist: String
    let name: String
    
    init(artist: String, title: String) {
        self.artist = artist
        self.name = title
    }
    // give our song a container 
    //let name: String is our value
    // the container for the food to put in the fridge
    var dictionaryRepresentation: [String: String] {
       return [nameKey: name, artistKey: artist]
    }
    
    // Taking the food out of the container and putting it into bowl (turning it from a dictionary to an instance of Song)
    // always deal with one thing in model. not may dictionaries for example
    init?(dictionary: [String: String]) {
    //pulling out of dictioanry
        guard let name = dictionary[nameKey], let artist = dictionary[artistKey] else { return nil}
        
        self.name = name
        self.artist = artist
    }
    
}

    func ==(lhs: Song, rhs: Song) -> Bool {
        return lhs.artist == rhs.artist &&
        lhs.name == rhs.name
        
    }
