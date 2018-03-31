////
////  PhotosVC.swift
////  Quizzical
////
////  Created by Rucha Patki on 3/31/18.
////  Copyright © 2018 ruchapatki. All rights reserved.
////
//
//
//import UIKit
//import Photos
//import OpalImagePicker
//
//
//class PhotosVC: UIViewController {
//
//    @IBOutlet weak var imgView: UIImageView!
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//    @IBAction func addImages(_ sender: Any) {
//        let imagePicker = OpalImagePickerController()
//        imagePicker.imagePickerDelegate = self as! OpalImagePickerControllerDelegate
////        fetchPhotos()
//
//    }
//
////    private func fetchPhotos() {
////        let fetchOptions: PHFetchOptions = {
////            let fetchOptions = PHFetchOptions()
////            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
////            return fetchOptions
////        }()
////
////        var photoAssets: [PHFetchResult<PHAsset>] = []
////        photoAssets = [PHAsset.fetchAssets(with: fetchOptions)]
////    }
//    
//    public func presentOpalImagePickerController(_ imagePicker: OpalImagePickerController, animated: Bool, select: @escaping (([PHAsset]) -> Void), cancel: @escaping (() -> Void), completion: (() -> Void)? = nil) {
//        let manager = OpalImagePickerManager.shared
//        manager.selectAssets = select
//        manager.cancel = cancel
//        imagePicker.imagePickerDelegate = manager
//        present(imagePicker, animated: animated, completion: completion)
//    }
//
//
//
//
//}

