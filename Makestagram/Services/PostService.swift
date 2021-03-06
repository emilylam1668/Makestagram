//
//  PostService.swift
//  Makestagram
//
//  Created by Emily Lam on 7/31/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

struct PostService {
    static func create(for image: UIImage) {
        let imageRef = Storage.storage().reference().child("test_image.jpg")
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            guard let downloadURL = downloadURL else {
                return
            }
            
            let urlString = downloadURL.absoluteString
            print("image url: \(urlString)")
        }
    }
}
