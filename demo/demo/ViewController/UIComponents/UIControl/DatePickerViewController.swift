//
//  DatePickerViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 29/03/23.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    let datePickerKeyboard = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerKeyboard.preferredDatePickerStyle = .wheels
        datePicker.preferredDatePickerStyle = .wheels
        dateField.inputView = datePickerKeyboard
        
        datePickerKeyboard.addTarget(self, action: #selector(setDate), for: .valueChanged)
    }
    
    @objc
    func setDate() {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        dateFormat.timeStyle = .short
        
        dateField.text = dateFormat.string(from: datePickerKeyboard.date)
    }
    
    @IBAction func changePicker(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            datePicker.isHidden = false
            dateField.isHidden = true
            datePicker.preferredDatePickerStyle = .wheels
            dateLabel.isHidden = false
        case 1:
            datePicker.isHidden = false
            dateField.isHidden = true
            datePicker.preferredDatePickerStyle = .compact
            dateLabel.isHidden = false
        case 2:
            datePicker.isHidden = false
            dateField.isHidden = true
            datePicker.preferredDatePickerStyle = .inline
            dateLabel.isHidden = false
        case 3:
            datePicker.isHidden = true
            dateField.isHidden = false
            dateLabel.isHidden = true
        default:
            break
        }
    }
    
    @IBAction func setDateTime(_ sender: Any) {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        dateFormat.timeStyle = .short
        
        dateLabel.text = dateFormat.string(from: datePicker.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
