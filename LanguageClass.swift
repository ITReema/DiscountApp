//
//  LanguageClass.swift
//  DiscountApp
//
//  Created by mac_os on 12/1/1438 AH.
//  Copyright © 1438 mac_os. All rights reserved.
//

import Foundation


class LanguageClass{
    
    static var shared = LanguageClass()
    
    func SetEnglish(){
    
        UserDefaults.standard.set("English", forKey: "Lang")
        
    }
    
    func SetArabic(){
        
        UserDefaults.standard.set("Arabic", forKey: "Lang")
        
    }
    
    enum langEnum{
        case English
        case Arabic
    }
    
    func GetCurrentLanguage() ->langEnum {
        let userDefaultValue = UserDefaults.standard.value(forKey: "Lang") as? String
        if userDefaultValue == nil {return .English}
        
        if userDefaultValue == "Arabic"{
            return .Arabic
        }
        else if userDefaultValue == "English"{
            return .English
        }
        
   return .English
    
    }
    
    
}
