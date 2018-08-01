//
//  StorageService.swift
//  Makestagram
//
//  Created by Emily Lam on 7/31/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage

struct StorageService {
    //provide method for uploading images
    static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
        guard let imageData = UIImageJPEGRepresentation(image, 0.1) else {
            return completion (nil)
        }
    
        reference.putData(imageData, metadata: nil, completion: { (metadata, error )in
            if let error = error {
                assertionFailure(error.localizedDescription)
            return completion (nil)
            }
    
            reference.downloadURL(completion: { (url, error) in
                if let error = error {
                    assertionFailure(error.localizedDescription)
                    return completion (nil)
                }
            completion(url)
            })
        })
    }
}
