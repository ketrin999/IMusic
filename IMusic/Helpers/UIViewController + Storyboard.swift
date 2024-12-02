//
//  UIViewController + Storyboard.swift
//  IMusic
//
//  Created by Ekaterina Yashunina on 22.03.2024.
//

import Foundation
import UIKit

extension UIViewController {

    class func loadFromStoryboard<T: UIViewController>() -> T {

        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: no initial view controller in \(name) storyboard")
        }
    }
}
