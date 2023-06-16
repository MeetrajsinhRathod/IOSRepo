//
//  UIPickerViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 29/03/23.
//

import UIKit

class UIPickerViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var colorPicker: UIPickerView!
    
    //MARK: - Variables
    let colors = ["white", "blue", "brown", "cyan", "gray", "green"]
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.delegate = self
        colorPicker.dataSource = self
    }
}

//MARK: - UIPickerView DataSource, Delegate
extension UIPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            view.backgroundColor = .white
        case 1:
            view.backgroundColor = .blue
        case 2:
            view.backgroundColor = .brown
        case 3:
            view.backgroundColor = .cyan
        case 4:
            view.backgroundColor = .gray
        case 5:
            view.backgroundColor = .green
        default:
            print("error")
        }
    }
}
