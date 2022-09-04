//
//  StoryBoard.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 04/09/2022.
//

import Foundation
import UIKit

class Storyboard {
    
    
  private class func storyboard() -> UIStoryboard {
    return UIStoryboard(name: "Main", bundle: nil)
  }
  
  class func viewController(by storyboardId:String) -> UIViewController{
    return storyboard().instantiateViewController(withIdentifier: storyboardId)
  }
    
    
}
