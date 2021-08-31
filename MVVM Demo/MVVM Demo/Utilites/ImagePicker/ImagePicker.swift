//
//  ImagePicker.swift
//  Kings Court
//
//  Created by gwl on 23/09/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
import BSImagePicker
import Photos
class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var picker = UIImagePickerController()
    var alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback: ((UIImage) -> Void)?
    var pickImagesCallback: (([UIImage]) -> Void)?
    var imgPicker = ImagePickerController()
    var isMultipleImages = false
    override init() {
        super.init()
    }

    func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> Void)) {
        pickImageCallback = callback
        self.viewController = viewController

        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
            self.openCamera()
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) { _ in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
        }
        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = self.viewController?.view
        viewController.present(alert, animated: true, completion: nil)
    }
    func pickMultipleImages(_ viewController: UIViewController, _ callback: @escaping (([UIImage]) -> Void)) {
        pickImagesCallback = callback
        self.viewController = viewController
        self.isMultipleImages = true
        imgPicker.settings.selection.max = 10
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
            self.openCamera()
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) { _ in
            self.openGallery(isSelectMultipleImage: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
        }
        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = self.viewController?.view
        viewController.present(alert, animated: true, completion: nil)
    }
    func openCamera() {
        alert.dismiss(animated: true, completion: nil)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            self.viewController?.present(picker, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Warning",
                                                    message: Localizable.Global.cameraWarning.localized,
                                                    preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (_) -> Void in
                debugPrint("You pressed OK")
            }
            alertController.addAction(okAction)
            self.viewController?.present(alertController, animated: true, completion: nil)
        }
    }
    func openGallery(isSelectMultipleImage: Bool = false) {
        alert.dismiss(animated: true, completion: nil)
        if isSelectMultipleImage {
            self.openMultipleImagesGallery()
        } else {
            picker.sourceType = .photoLibrary
            self.viewController?.present(picker, animated: true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    // For Swift 4.2+
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        isMultipleImages ? self.pickImagesCallback?([image]) : pickImageCallback?(image)
    }

    func openMultipleImagesGallery() {
        imgPicker.navigationBar.barTintColor = UIColor.enableColor
        viewController?.presentImagePicker(imgPicker, select: { (asset) in
          debugPrint("Selected: \(asset)")
        }, deselect: { (asset) in
            debugPrint("Deselected: \(asset)")
        }, cancel: { (assets) in
            debugPrint("Canceled with selections: \(assets)")
        }, finish: { (assets) in
            debugPrint("Finished with selections: \(assets)")
            self.convertToUiimage(imageAssets: assets)
        })
    }
    func convertToUiimage(imageAssets: [PHAsset]) {
        var imageArray: [UIImage] = []
        for item in imageAssets.enumerated() {
            if item.element.mediaType == .image {
                item.element.requestContentEditingInput(with: PHContentEditingInputRequestOptions()) { (eidtingInput, info) in
                    if let value = info["PHContentEditingInputErrorKey"] as? Error {
                        debugPrint("Error : ", value.localizedDescription)
                    }
                    if let input = eidtingInput, let imgURL = input.fullSizeImageURL {
                        debugPrint( imgURL)
                        if let image = input.displaySizeImage {
                            imageArray.append(image)
                            if item.offset == imageAssets.count - 1 {
                                self.pickImagesCallback?(imageArray)
                            }
                        }
                    }
                }
            }
        }
    }
}
