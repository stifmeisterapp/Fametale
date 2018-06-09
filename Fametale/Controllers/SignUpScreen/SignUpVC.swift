//
//  SignUpVC.swift
//  Fametale
//
//  Created by Callsoft on 08/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var btnSignUpRef: UIButton!
    
    //MARK:- VARIABLE
    //MARK:
    let gradient = Gradient.singletonGradientObj
    
    @IBOutlet weak var lblAlreadyHaveAccount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMethod()
        
        

        // Do any additional setup after loading the view.
    }
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialMethod(){
        let signUpButtonGradient = gradient.createBlueGreenGradient(from: btnSignUpRef.bounds)
        self.btnSignUpRef.layer.insertSublayer(signUpButtonGradient, at: 0)
        btnSignUpRef.layer.cornerRadius = 5
        btnSignUpRef.layer.masksToBounds = true
        let text = lblAlreadyHaveAccount.text
        let textRange = NSRange(location: 25, length: 6)
        var attributedText = NSMutableAttributedString(string: text!)
        attributedText.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: textRange)
        attributedText.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red: 74.0/255, green: 192.0/255, blue: 194.0/255, alpha: 1.0), range: textRange)
        lblAlreadyHaveAccount.attributedText = attributedText
    }

}

