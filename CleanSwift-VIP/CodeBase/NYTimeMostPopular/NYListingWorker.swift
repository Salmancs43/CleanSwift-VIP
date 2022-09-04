//
//  NYListingWorker.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 04/09/2022.
//

import Foundation
import Alamofire

class NYListingWorker
{
    
    
    func makeApiRequestForPopulatListing<T:Decodable>(request:URLRequest , dataType : T.Type , completionHander : @escaping(APIResonse<T>) -> Void)
    {
        
        AF.request(request).responseData { response in
            
            switch response.result
            {
            case .success(let value):
            
                do
                {
                    let decodeResult = try JSONDecoder().decode(T.self, from: value)
                    completionHander(APIResonse.success(decodeResult))
                }
                catch let error
                {
                    completionHander(APIResonse.error(APIError.internalFailed(error: error)))
                }
                
            case .failure(let error):
                                        
                completionHander(APIResonse.error(APIError.internalFailed(error: error)))
                                        
            }
        }
    }
    
  
}


