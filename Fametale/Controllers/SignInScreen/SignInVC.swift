//
//  SignInScreen.swift
//  Fametale
//
//  Created by Callsoft on 08/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    //MARK:- OUTLETS
    //MARK:
    @IBOutlet weak var btnSignInRef: UIButton!
    @IBOutlet weak var lblNewToFametale: UILabel!
    //MARK:- VARIABLES
    //MARK:
    let gradient = Gradient.singletonGradientObj
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
    }
    
    //MARK:- METHODS
    //MARK:
    func initialSetup(){
        
        let signInButtonGradient = gradient.createBlueGreenGradient(from: btnSignInRef.bounds)
        self.btnSignInRef.layer.insertSublayer(signInButtonGradient, at: 0)
        btnSignInRef.layer.cornerRadius = 5
        btnSignInRef.layer.masksToBounds = true
        
        let text = lblNewToFametale.text
        let textRange = NSRange(location: 17, length: 6)
        var attributedText = NSMutableAttributedString(string: text!)
        attributedText.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: textRange)
        attributedText.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red: 74.0/255, green: 192.0/255, blue: 194.0/255, alpha: 1.0), range: textRange)
        lblNewToFametale.attributedText = attributedText
    }
}

