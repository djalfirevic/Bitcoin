//
//  UIViewController+Extensions.swift
//  Bitcoin
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class var identifier: String {
        return String(describing: self)
    }
    
}
