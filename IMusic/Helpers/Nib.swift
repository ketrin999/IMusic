//
//  Nib.swift
//  IMusic
//
//  Created by Ekaterina Yashunina on 16.04.2024.
//

import UIKit

extension UIView {

    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T

    }
}
