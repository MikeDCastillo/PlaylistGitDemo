//
//  PlaylistDetailTableViewController.swift
//  PlaylistAgain
//
//  Created by Michael Castillo on 2/8/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import UIKit

class PlaylistDetailTableViewController: UITableViewController {

    var playlist: Playlist?
    
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard  let songName = songNameTextField.text, let artistName = artistNameTextField.text, let playlist = self.playlist else { return }
        SongController.sharedController.addSongWith(name: songName, artist: artistName, to: playlist)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = playlist?.playlistTitle
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playlist?.songs.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        guard let playlist = playlist else { return UITableViewCell() }
        let song = playlist.songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist

        return cell
    }

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist else { return }
            let song = playlist.songs[indexPath.row]
            SongController.sharedController.delete(song: song, from: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
