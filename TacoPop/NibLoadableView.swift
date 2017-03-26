//
//  NibLoadableView.swift
//  TacoPop
//
//  Created by Ravi Tiwari on 3/25/17.
//  Copyright © 2017 SelfStudy. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
