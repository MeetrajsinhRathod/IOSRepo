//
//  UIToolBarViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 28/03/23.
//

import UIKit

class UIToolBarViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var songToolbar: UIToolbar!
    
    var playing = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func rewindTapped(_ sender: Any) {
        statusLabel.text = "Rewinding song"
    }
    
    @IBAction func playTapped(_ sender: Any) {
        
        
        
        if !playing {
            Play()
        }
        else {
           Pause()
        }
    }
    
    func Play() {
        var barItems = songToolbar.items
        statusLabel.text = "Playing..."
        barItems?[2] = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: #selector(playTapped(_:)))
        playing = true
        songToolbar.setItems(barItems, animated: true)
    }
    
    func Pause() {
        var barItems = songToolbar.items
        statusLabel.text = "Paused"
        barItems?[2] = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(playTapped(_:)))
        playing = false
        songToolbar.setItems(barItems, animated: true)
    }
    @IBAction func forwardTapped(_ sender: Any) {
        statusLabel.text = "Fast forwarding song"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
