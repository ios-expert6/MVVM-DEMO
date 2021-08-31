//
//  ImageViewExtension.swift
//  Kings Court
//
//  Created by gwl on 02/11/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
extension UIImageView {
    func setImageCornerRadius(radius: CGFloat, boarderWidth: Double, boarderColor: UIColor) {
        layer.cornerRadius = radius
        layer.borderWidth = CGFloat(boarderWidth)
        layer.borderColor = boarderColor.cgColor
    }
    func convertImagetobase64UrlString() -> String {
        let imagePostPrefix: String = "data:image/png;base64,"
        var strBase64 = ""
        var imageData = self.image?.jpegData(compressionQuality: 0.8) // UIImageJPEGRepresentation(image, 1.0)
        var imageSize: Int = imageData?.count ?? 0
        imageSize = (imageData?.count ?? 0)
        imageSize = (imageSize / 1024)/1024
        debugPrint("Original size of image in MB: %f ", (imageSize / 1024)/1024)
        if imageData != nil {
            if imageSize >= 1 {
                imageData = image?.jpegData(compressionQuality: 0.8)
            }
            strBase64 = imagePostPrefix + (imageData?.base64EncodedString(options:
                                                            .lineLength64Characters) ?? "")
        }
        return strBase64
    }
    func downloadImage(`with` urlString : String, imageView: UIImageView) {
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url)
        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { (image, error, url, data)  in
            if image != nil {
                imageView.image = image
            }
        }
    }
}
