//
//  UIToolBarViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 28/03/23.
//

import UIKit

class UIToolBarViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var songToolbar: UIToolbar!
    
    //MARK: - Variables
    var playing = false
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    @IBAction func rewindTapped(_ sender: Any) {
        statusLabel.text = "Rewinding song"
    }
    
    @IBAction func playTapped(_ sender: Any) {
        if !playing { Play() } else { Pause() }
    }
    
    @IBAction func forwardTapped(_ sender: Any) {
        statusLabel.text = "Fast forwarding song"
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
}
