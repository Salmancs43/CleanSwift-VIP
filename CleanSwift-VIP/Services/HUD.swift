//
//  HUD.swift
//  CleanSwift-VIP
//
//  Created by Muhammad Salman on 04/09/2022.
//

import Foundation
import KRProgressHUD


class HUD
{
    static let sharedInstance = HUD()
    
    func showHud()
    {
        KRProgressHUD.show()
    }
    
    func hideHud()
    {
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
           KRProgressHUD.dismiss()
        }
    }
}
