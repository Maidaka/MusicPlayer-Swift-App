//
//  ButtonScreen.swift
//  MusicPlayer
//
//  Created by Maida on 11/24/20.
//

import UIKit
import MediaPlayer

class ButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    @IBAction func StopTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func NextTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String){
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate( value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
