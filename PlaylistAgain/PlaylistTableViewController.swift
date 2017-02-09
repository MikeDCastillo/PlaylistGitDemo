//
//  PlaylistTableViewController.swift
//  PlaylistAgain
//
//  Created by Michael Castillo on 2/8/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {


    @IBOutlet weak var playlistNameTextfield: UITextField!
    
    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
        guard let name = playlistNameTextfield.text else { return }
        PlaylistController.sharedController.addPlaylist(name: name)
        playlistNameTextfield.text = ""
        tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.sharedController.playlists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        let playlist = PlaylistController.sharedController.playlists[indexPath.row]
        cell.textLabel?.text = playlist.playlistTitle
        cell.detailTextLabel?.text = "\(playlist.songs.count) songs"
        return cell
    }



    // delete row from TV
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // delete the model instance first
            //this is the swiped row. looks at indexpath.row
            let playlist = PlaylistController.sharedController.playlists[indexPath.row]
            PlaylistController.sharedController.delete(playlist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //what road are we taking
    // what are we passing - 2 step line
        // where we going
        //what where
        if segue.identifier == "toPlaylistDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let playlistTVC = segue.destination as? PlaylistDetailTableViewController else { return }
            let playlist = PlaylistController.sharedController.playlists[indexPath.row]
            playlistTVC.playlist = playlist
        }
    }
}
