//
//  UIImageView+Extensions.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 04/09/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView
{
    func makeImageViewCircle()
    {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
        
    }
    
    
    func downloadImageUsingkingfisher(url: inout String, placeholder:UIImage?)
    {
        if url == ""
        {
            return
        }
        
        url = url.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!
        
        let downloadUrl = URL(string: url)
        
        self.kf.indicatorType = .activity
        
        var options: KingfisherOptionsInfo = []
        options.append(.transition(.fade(1)))
        options.append(.loadDiskFileSynchronously)
        
        
        self.kf.setImage(with: downloadUrl, placeholder: nil, options:options) { result in
            
        }
        
        
    }
}
