//
//  Response.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 03/09/2022.
//

import Foundation

enum APIResonse<T>
{
    case success(T)
    case error(APIError)
}
