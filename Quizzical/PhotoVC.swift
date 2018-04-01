//
//  PhotoVC.swift
//  Quizzical
//
//  Created by Rucha Patki on 3/31/18.
//  Copyright © 2018 ruchapatki. All rights reserved.
//

import UIKit
import Firebase

var needsReset = false;

class PhotoVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quizButton: UIButton!
    @IBOutlet weak var selectImgBtn: UIButton!
    
    var myImg: UIImage!
    
    let imagePicker = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 0.5
        quizButton.isEnabled = false
        quizButton.layer.cornerRadius = 10
        selectImgBtn.layer.cornerRadius = 10
    }

    @IBAction func selectPhoto(_ sender: Any) {
        quizButton.isEnabled = false
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated:true, completion:nil)
    }
    
    @IBAction func quizClicked(_ sender: Any) {
        storageWrite()
    }
    
}


extension PhotoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
    
    func storageWrite(){
        var storageRef = Storage.storage().reference().child("images/img.png")
        let data = UIImagePNGRepresentation(myImg)
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        let uploadTask = storageRef.putData(data!, metadata: metadata)
    }
 
}
