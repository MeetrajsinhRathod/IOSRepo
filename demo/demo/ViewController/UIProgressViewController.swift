//
//  UIProgressViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 16/03/23.
//

import UIKit

class UIProgressViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    var progress = Progress(totalUnitCount: 10)
    var isRunning = false
    var val = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progress.completedUnitCount = 0
        
        
        //countLabel.text = String(val)
        //change height of the progress bar
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 5)
    }
    
    @IBAction func countUpInside(_ sender: Any) {
        if !isRunning {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(increaseVal), userInfo: nil, repeats: true)
        }
    }
    
    @objc func increaseVal() {
        isRunning = true
        
        if progress.isFinished {
            timer?.invalidate()
            isRunning = false
            progress.completedUnitCount = 0
            val = 0
            stepper.value = 0
        } else {
            val += 1
            progress.completedUnitCount += 1
            stepper.value = Double(progress.completedUnitCount)
            //progressBar.progress = val
            progressBar.setProgress(Float(progress.fractionCompleted), animated: true)
            countLabel.text = String(val)
        }
    }
    
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        val = Int(stepper.value)
        countLabel.text = String(val)
        progress.completedUnitCount = Int64(stepper.value)
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
