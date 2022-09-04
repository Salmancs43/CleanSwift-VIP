//
//  NYListingInteractor.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 04/09/2022.
//

import Foundation


protocol ProtocolListingInteractor {
    
    func callNYTimeMostPopularApi()
}


class NYListingInteractor : ProtocolListingInteractor
{
    
    var presentor : ProtocolListingPresentor?
    
    func callNYTimeMostPopularApi() {
        
        
        let worker = NYListingWorker()
        
        let listing = NYTimeListing.NYTimePopularListing
        do
        {
            let request = try listing.asURLRequest()
            worker.makeApiRequestForPopulatListing(request: request , dataType: NYMostPopularLsitingModel.self) { response in
                
               
                self.presentor?.successfullyFetchListing(with: response)
            }
        }
        catch let error
        {
            
            self.presentor?.errorInFetchingResponse(with: error.localizedDescription)
        }
      
     
    }
}
