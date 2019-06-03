//
//  UIImageView+Extensions.swift
//  Bitcoin
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import Foundation
import UIKit

let cache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    
    func loadImage(from imageUrl: String) {
        if let image = cache.object(forKey: imageUrl as AnyObject) as? UIImage {
            self.image = image
            return
        }
        
        if let url = URL(string: imageUrl) {
            DispatchQueue.global(qos: .userInitiated).async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async { [weak self] in
                    if let data = data, url.absoluteString == imageUrl {
                        if let image = UIImage(data: data) {
                            self?.image = image
                            cache.setObject(image, forKey: imageUrl as AnyObject)
                        }
                    }
                }
            }
        }
    }
    
}
