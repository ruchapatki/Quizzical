//
//  PhotoVC.swift
//  Quizzical
//
//  Created by Rucha Patki on 3/31/18.
//  Copyright © 2018 ruchapatki. All rights reserved.
//

import UIKit
//import Firebase
//import FirebaseDatabase

class PhotoVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quizButton: UIButton!
    var myImg: UIImage!
    
    let imagePicker = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 0.5
        quizButton.isEnabled = false
    }

    @IBAction func selectPhoto(_ sender: Any) {
        quizButton.isEnabled = false
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated:true, completion:nil)
    }
    
//    @IBAction func forFire(_ sender: Any) {
//        Database.database().reference().child("pictures").setValue("hi")
//    }
    
    
}


extension PhotoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // when the user clicks cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        myImg = image
        imageView.image = image
        imageView.layer.borderWidth = 0
        dismiss(animated: true, completion: nil)
        quizButton.isEnabled = true
    }
 
}
