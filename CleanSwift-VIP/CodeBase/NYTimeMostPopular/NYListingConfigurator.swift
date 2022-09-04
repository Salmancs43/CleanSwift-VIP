//
//  NYListingConfigurator.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 04/09/2022.
//

import Foundation
import UIKit

class NYListingConfigurator
{
    static let sharedInstance = NYListingConfigurator()
    
    private init() {
        
    }
    
    func setup(view:NYListingViewController)
    {
        
       
      
        let router = NYListingRouter()
        
        view.router = router
        
        let prsentor = NYListingPresentor()
        
        prsentor.view = view
        
        
        let interactor = NYListingInteractor()
        
        view.interactor  = interactor
        
        interactor.presentor = prsentor
        
        
        
        
       
    }
}
