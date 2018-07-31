//
//  Storyboard+Utility.swift
//  Makestagram
//
//  Created by Emily Lam on 7/31/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation

extension UIStoryboard {
    
    enum MGType: String {
        case main
        case login
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(type: MGType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    static func initialViewController(for type: MGType) -> ViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
        }
        return initialViewController
    }
    
    
    
    
    
    
    
}
