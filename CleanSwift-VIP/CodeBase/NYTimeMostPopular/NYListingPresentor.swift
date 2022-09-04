//
//  NYListingPresentor.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 04/09/2022.
//

import Foundation

protocol ProtocolListingPresentor {
    
    
    func successfullyFetchListing(with listing:APIResonse<NYMostPopularLsitingModel>)
    func errorInFetchingResponse(with error:String)
}


class NYListingPresentor : ProtocolListingPresentor
{
    
    var view : ProtocolNYLsitingView?
    
    func successfullyFetchListing(with listing: APIResonse<NYMostPopularLsitingModel>) {
        
        switch listing
        {
            case .success(let model):
                print(model)
           
            view?.updateView(with: model)
            
            case .error (let error):
                print(error)
            view?.updateView(with: error.localizedDescription)
        }
    }
    
    func errorInFetchingResponse(with error: String) {
        
        view?.updateView(with: error)
    }
    
    
}
