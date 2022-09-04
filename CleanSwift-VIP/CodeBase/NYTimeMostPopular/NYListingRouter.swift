//
//  NYListingRouter.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 04/09/2022.
//

import Foundation


protocol ProtocolListingRouter{
    
    func navigateToDetailScreen(viewController:NYListingViewController , with object:NYMostPopularResult)
    
}


class NYListingRouter : ProtocolListingRouter
{
    
    func navigateToDetailScreen(viewController: NYListingViewController, with object: NYMostPopularResult) {
        
        if let vc = Storyboard.viewController(by: "NYListingDetailViewController") as? NYListingDetailViewController
        {
            vc.object = object
            viewController.navigationController?.pushViewController(vc, animated: true)
        }
       
    }
    
}
