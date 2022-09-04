//
//  ApiProvider.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 03/09/2022.
//

import Foundation

import Alamofire

protocol APIConfiguration : URLRequestConvertible {
    
    var method : HTTPMethod {get}
    
    var parameter : Parameters? {get}
    
    var path : String {get}
}


enum ContentType : String
{
    case json = "application/json"
}

enum NYTimeListing : APIConfiguration
{
    case NYTimePopularListing
    var method: HTTPMethod
    {
        switch(self)
        {
        case.NYTimePopularListing:
            return .get
        }
        
    }
    
    var parameter: Parameters?
    {
        switch(self)
        {
        case .NYTimePopularListing:
            let params = ["api-key" : API_KEY]
            return params
        }
    }
    
    var path: String
    {
        switch(self)
        {
        case .NYTimePopularListing:
            return "svc/mostpopular/v2/viewed/7.json"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        var url : URL
        
        switch (self)
        {
        case .NYTimePopularListing:
            url =  try BASE_URL.asURL()
        }
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.method = method
        
        if let parameter = parameter {
            
            do
            {
                if method.rawValue != "GET"
                {
                    urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameter)
                }
                else
                {
                    urlRequest = try URLEncoding.default.encode(urlRequest, with: parameter)
                }
            }
            catch
            {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
        
    }
    
    
}



