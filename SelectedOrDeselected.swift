//
//  SelectedOrDeselected.swift
//  DiscountApp
//
//  Created by mac_os on 11/30/1438 AH.
//  Copyright © 1438 mac_os. All rights reserved.
//

import UIKit
import Foundation



class SelectOrDeselect {
    
    
    static var shared = SelectOrDeselect()
    
    
    
    func Select(Element : UIView ){
    
        Element.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
   
    func Deselect(Element : [UIView] ){
        
        for One in Element {
           One.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        }
        
    }
    
    
    enum Views {
        case Price
        case Tax
        case Discount

    }
    
    var SelectedView : Views = .Price
    
}
