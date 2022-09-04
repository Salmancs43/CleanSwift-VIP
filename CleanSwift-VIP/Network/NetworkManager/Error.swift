//
//  Error.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 03/09/2022.
//

import Foundation

enum ErrorCodes : Int
{
    
    case invalidUrl = 404
    
}


public struct FailuerReason
{
    var code : Int
    var message:String?
    
    
    init(code:Int , message:String? = nil) {
        
        self.code = code
        
        if message != nil
        {
            
            self.message = self.getMessage()
        }
        else
        {
            self.message =  message
        }
    }
    
    func getMessage() -> String
    {
        var messageString = "Something went wrong"
        
        switch (self.code)
        {
        case ErrorCodes.invalidUrl.rawValue:
            messageString = "Invalid Url"
            
        default:
            messageString = "Unknown Erroor"
        }
        
        return messageString
        
    }
}


enum APIError : Error
{
case internalFailed(error:Error)
case parseFailed(reason:FailuerReason)
}
