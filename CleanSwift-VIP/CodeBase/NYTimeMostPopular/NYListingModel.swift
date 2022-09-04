//
//  NYListingModel.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 04/09/2022.
//

import Foundation

struct NYMostPopularLsitingModel : Decodable
{
    var status : String?
    var copyright : String?
    var num_results : Int?
    
    var results : [NYMostPopularResult]
}


struct NYMostPopularResult : Decodable
{
    var uri : String?
    var url : String?
    var copyright : String?
    var id : Int?
    var asset_id : Int?
    var source : String?
    var published_date : String?
    var updated : String?
    var section : String?
    var subsection : String?
    var nytdsection : String?
    var adx_keywords : String?
    var column : String?
    var byline : String?
    var type : String?
    var title : String?
    var abstract : String?
    var eta_id : Int?
    var media : [NYMostPopularListingMedia]
   
}


struct NYMostPopularListingMedia : Decodable
{
    var type : String?
    var subtype : String?
    var mediametadata : [NYMostPopularListingMediaMeteData]
  
    private enum CodingKeys : String, CodingKey {
            case type, mediametadata = "media-metadata", subtype
        }
    
    
 
}

struct NYMostPopularListingMediaMeteData : Decodable
{
    var url : String?
    var format : String?
    var height : Int?
    var width : Int?
    
    
 
}
