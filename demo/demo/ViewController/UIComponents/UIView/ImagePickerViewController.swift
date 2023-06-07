//
//  ImagePickerViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 17/03/23.
//

import UIKit

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectImgBtn: UIButton!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.center = view.center
    }
    
    //MARK: - IBAction
    @IBAction func selectImg(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    //MARK: - Image Picker Controller
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        imageView.image = image
        dismiss(animated: true)
    }
}
