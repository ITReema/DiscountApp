//
//  SettingsViewController.swift
//  DiscountApp
//
//  Created by mac_os on 12/1/1438 AH.
//  Copyright © 1438 mac_os. All rights reserved.
//

import Foundation
import UIKit
class SettingViewController : CustomViewController {
    
    
    @IBOutlet weak var BackButtonOutlet: UIButton!
    
    @IBAction func EnglishAction(_ sender: Any) {
        
        BackButtonOutlet.setTitle("Back", for: .normal)
        LanguageClass.shared.SetEnglish()
        
    }
    
    
    @IBAction func ArabicAction(_ sender: Any) {
        
        BackButtonOutlet.setTitle("رجوع", for: .normal)
        LanguageClass.shared.SetArabic()
    }
    
    
    
    @IBAction func BackAction(_ sender: Any) {
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if LanguageClass.shared.GetCurrentLanguage() == .Arabic{
            BackButtonOutlet.setTitle("رجوع", for: .normal)
        }
    }
    
}
