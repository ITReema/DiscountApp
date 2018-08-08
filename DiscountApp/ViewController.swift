//
//  ViewController.swift
//  DiscountApp
//
//  Created by mac_os on 11/29/1438 AH.
//  Copyright © 1438 mac_os. All rights reserved.
//

import UIKit

class ViewController: CustomViewController {
    
       
    @IBOutlet weak var PriceOutlet: UIView!
    
    @IBOutlet weak var TaxOutlet: UIView!
    
    @IBOutlet weak var DiscountOutlet: UIView!
    
    
    @IBOutlet weak var PriceLabel: UILabel!

    
    //هذا المتغير عشان يكتب لنا بالشاشة الرقم
    var PriceX : Double = 0.0{
        didSet{
            
            PriceLabel.text = String(PriceX)
            
            CalculeteFinalPrice()
        }
    }
    
    
    
    
    @IBAction func PriceTappedAction(_ sender: Any) {
        
        SelectOrDeselect.shared.Select(Element: PriceOutlet)
        
        SelectOrDeselect.shared.Deselect(Element: [
            TaxOutlet , DiscountOutlet ])
        
        SelectOrDeselect.shared.SelectedView = .Price
        
    }
    
    
    @IBAction func TaxTappedAction(_ sender: Any) {
    
        SelectOrDeselect.shared.Select(Element: TaxOutlet)
        
        SelectOrDeselect.shared.Deselect(Element: [
            PriceOutlet , DiscountOutlet])
        
        SelectOrDeselect.shared.SelectedView = .Tax
        
    }
    
    
    @IBAction func DiscountTappedAction(_ sender: Any) {
        
        SelectOrDeselect.shared.Select(Element: DiscountOutlet)
        
        SelectOrDeselect.shared.Deselect(Element: [
            PriceOutlet , TaxOutlet ])
        
        SelectOrDeselect.shared.SelectedView = .Discount
        
    }
    
    
//هنا ربطنا كل الارقام بهذا functionl من خلال ctrl و
   // السحب عليه داخل هذا function
    
    @IBAction func ButtonsAction(_ sender: UIButton) {
    
        
        let StrPriceX : String = String(PriceX)
        
        if StrPriceX.characters.count > 15 {return}
        
        if SelectOrDeselect.shared.SelectedView == .Price {
        
        if IsDot {
            
            if AfterDotNumberCount < 4 {
            
            var FirstZeroDot = "0."
            
            if AfterDotNumberCount > 0 {
            
            for _ in 1...AfterDotNumberCount {
                FirstZeroDot = FirstZeroDot + "0"
                }
            }
            
            PriceX += Double( FirstZeroDot + String(sender.tag))!
            
            AfterDotNumberCount += 1
            
        }
                
        } else {
            
            PriceX = Double(String(Int (PriceX))+String(sender.tag))!
        }
            
        }
        
        
        else if SelectOrDeselect.shared.SelectedView == .Discount {
            
            if Int(String(DiscountX)+String(sender.tag))! < 100 {
            
                DiscountX = Int(String(DiscountX) + String(sender.tag))!
            
            }
            
        }
        
        else if SelectOrDeselect.shared.SelectedView == .Tax {
        
            if Int(String(TaxX)+String(sender.tag))! < 100 {
                
                TaxX = Int(String(TaxX) + String(sender.tag))!
                
            }

            
        
        
        }
    
    
    }
    
    var AfterDotNumberCount = 0
    var IsDot : Bool = false
    
    @IBAction func DotButtonAction(_ sender: Any) {
        
        let StrPriceX : String = String(PriceX)
        if StrPriceX.characters.count > 15 {return}
        
        IsDot = true

    }
    
    @IBAction func BackSpaceButtonAction(_ sender: Any) {
        
        
        if SelectOrDeselect.shared.SelectedView == .Price{
            if IsDot && AfterDotNumberCount > 0 {
                
                var StrPriceX : String = String(PriceX)
                StrPriceX.remove(at: StrPriceX.index(before: StrPriceX.endIndex))
                
                AfterDotNumberCount -= 1
                
                if StrPriceX.characters.last == "."{
                    StrPriceX.remove(at: StrPriceX.index(before: StrPriceX.endIndex))
                    IsDot = false
                }
                
       PriceX = Double(StrPriceX)!
            
            }else{
                
                
                var StrPriceX : String = String(Int(PriceX))
                
                if StrPriceX.characters.count > 1 {
                
                StrPriceX.remove(at: StrPriceX.index(before: StrPriceX.endIndex))
                }
                else{
                    if StrPriceX != "0"{
                     StrPriceX = "0"
                }
    
            }
                
                PriceX = Double(StrPriceX)!
        }

        } else if SelectOrDeselect.shared.SelectedView == .Discount {
            
            var DiscountStrX = String (DiscountX)
            
            if DiscountStrX.characters.count > 1 {
                DiscountStrX.remove(at: DiscountStrX.index(before: DiscountStrX.endIndex))
               
            }
            else{
                if DiscountStrX != "0"{
                DiscountStrX = "0"
                }
            }
            
            DiscountX = Int(DiscountStrX)!
        }
        else if SelectOrDeselect.shared.SelectedView == .Tax{
            
            
            var TaxStrX = String (TaxX)
            
            if TaxStrX.characters.count > 1 {
                TaxStrX.remove(at: TaxStrX.index(before: TaxStrX.endIndex))
                
            }
            else{
                if TaxStrX != "0"{
                    TaxStrX = "0"
                }
            }
            
            TaxX = Int(TaxStrX)!
            
        }
        
        
    }
    
    
    
    @IBOutlet weak var DiscountLabel: UILabel!

    var DiscountX : Int = 0{
        didSet{
            
           DiscountLabel.text = String(DiscountX) + "%"
            
            CalculeteFinalPrice()
            
        }
    }
    
    @IBOutlet weak var TaxLabel: UILabel!
    
    var TaxX : Int = 0 {
        didSet{
            TaxLabel.text = String(TaxX) + "%"
            CalculeteFinalPrice()
        }
    }
    
    
    func CalculeteFinalPrice(){
        
        let price = PriceX
        let discount = Double(DiscountX)
        let tax = Double(TaxX)
        
        let ResultOfDiscount = price - (price * discount) / 100
        FinalPriceLabel.text = String(ResultOfDiscount + (ResultOfDiscount * tax) / 100)
    
        
    }
    
    @IBOutlet weak var FinalPriceLabel: UILabel!
    
    
    @IBAction func CButtonAction(_ sender: Any) {
        
        PriceX = 0.0
        DiscountX = 0
        TaxX = 0
        
        SelectOrDeselect.shared.Select(Element: PriceOutlet)
        SelectOrDeselect.shared.Deselect(Element: [TaxOutlet , DiscountOutlet])
        
        IsDot = false
        AfterDotNumberCount = 0
    }
    
    @IBAction func TapButtonAction(_ sender: Any) {
        
        if SelectOrDeselect.shared.SelectedView == .Price {
            
            SelectOrDeselect.shared.Select(Element: DiscountOutlet)
            
            SelectOrDeselect.shared.SelectedView = .Discount
            
            SelectOrDeselect.shared.Deselect(Element: [PriceOutlet , TaxOutlet])
            
        }
        else if SelectOrDeselect.shared.SelectedView == .Discount {
            
            SelectOrDeselect.shared.Select(Element: TaxOutlet)
            
            SelectOrDeselect.shared.SelectedView = .Tax

            
            SelectOrDeselect.shared.Deselect(Element: [PriceOutlet , DiscountOutlet])
            
        }
        else if SelectOrDeselect.shared.SelectedView == .Tax {
            
            SelectOrDeselect.shared.Select(Element: PriceOutlet)
            
            SelectOrDeselect.shared.SelectedView = .Price

            
            SelectOrDeselect.shared.Deselect(Element: [DiscountOutlet , TaxOutlet])
        }

    }
    
    @IBAction func SettingsButtonAction(_ sender: Any) {
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if LanguageClass.shared.GetCurrentLanguage() == .Arabic{
            
            SettingButtonOutlet.setTitle("الإعدادات", for: .normal)
            TapButtonOutlet.setTitle("إنتقال", for: .normal)
            
            FinalPriceL.text = "السعر النهائي"
            TaxL.text = "الضرائب"
            PriceL.text = "السعر"
            DiscountL.text = "الخصم"
            OneL.setTitle("١", for: .normal)
            TwoL.setTitle("٢", for: .normal)
            ThreeL.setTitle("٣", for: .normal)
            FourL.setTitle("٤", for: .normal)
            FiveL.setTitle("٥", for: .normal)
            SixL.setTitle("٦", for: .normal)
            SevenL.setTitle("٧", for: .normal)
            EightL.setTitle("٨", for: .normal)
            NineL.setTitle("٩", for: .normal)
            ZeroL.setTitle("٠", for: .normal)
            DelL.setTitle("حذف", for: .normal)

            
        }else{
           
            SettingButtonOutlet.setTitle("Settings", for: .normal)
            TapButtonOutlet.setTitle("Tap", for: .normal)
            
            FinalPriceL.text = "Final Price"
            TaxL.text = "Tax"
            PriceL.text = "Price"
            DiscountL.text = "Discount"
            OneL.setTitle("1", for: .normal)
            TwoL.setTitle("2", for: .normal)
            ThreeL.setTitle("3", for: .normal)
            FourL.setTitle("4", for: .normal)
            FiveL.setTitle("5", for: .normal)
            SixL.setTitle("6", for: .normal)
            SevenL.setTitle("7", for: .normal)
            EightL.setTitle("8", for: .normal)
            NineL.setTitle("9", for: .normal)
            ZeroL.setTitle("0", for: .normal)
            DelL.setTitle("DEL", for: .normal)
            
            
        }
    }
    
    
  
    @IBOutlet weak var PriceL: UILabel!
    
    @IBOutlet weak var DiscountL: UILabel!
    
    @IBOutlet weak var TaxL: UILabel!
    
    @IBOutlet weak var FinalPriceL: UILabel!
    
    @IBOutlet weak var TapButtonOutlet: UIButton!
    
    @IBOutlet weak var SettingButtonOutlet: UIButton!
    
    @IBOutlet weak var OneL : UIButton!
    
    @IBOutlet weak var TwoL: UIButton!
    
    @IBOutlet weak var ThreeL: UIButton!
    
    @IBOutlet weak var FourL: UIButton!
    
    @IBOutlet weak var FiveL: UIButton!
    
    @IBOutlet weak var SixL: UIButton!
    
    @IBOutlet weak var SevenL: UIButton!
    
    @IBOutlet weak var EightL: UIButton!
    
    @IBOutlet weak var NineL: UIButton!
    
    @IBOutlet weak var ZeroL: UIButton!
    
    @IBOutlet weak var DelL: UIButton!
    
    
}
