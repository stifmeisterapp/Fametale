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
    
    @IBOutlet weak var btnRememberMe: UIButton!
    @IBOutlet weak var btnSignInRef: UIButton!
    @IBOutlet weak var lblNewToFametale: UILabel!
    @IBOutlet weak var lblForgotPassword: UILabel!
    //MARK:- VARIABLES
    //MARK:
    let gradient = Gradient.singletonGradientObj
    var btnRememberMeState = false
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK:- METHODS
    //MARK:
    func initialSetup(){
        if btnRememberMeState == false{
        btnRememberMe.setImage(#imageLiteral(resourceName: "remember_unselected"), for: .normal)
        }
        else{
            btnRememberMe.setImage(#imageLiteral(resourceName: "remember_selected"), for: .normal)
        }
        let signInButtonGradient = gradient.createBlueGreenGradient(from: btnSignInRef.bounds)
        self.btnSignInRef.layer.insertSublayer(signInButtonGradient, at: 0)
        btnSignInRef.layer.cornerRadius = 5
        btnSignInRef.layer.masksToBounds = true
        
        let text = lblNewToFametale.text
        let textRange = NSRange(location: 17, length: 7)
        var attributedText = NSMutableAttributedString(string: text!)
        attributedText.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: textRange)
        attributedText.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red: 74.0/255, green: 192.0/255, blue: 194.0/255, alpha: 1.0), range: textRange)
        lblNewToFametale.attributedText = attributedText
        
        
        lblNewToFametale.isUserInteractionEnabled = true // Remember to do this
        let tapLblNewToFametale: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(newtoFametale))
        lblNewToFametale.addGestureRecognizer(tapLblNewToFametale)
        
        lblForgotPassword.isUserInteractionEnabled = true // Remember to do this
        let tapLblForgotPassword: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(forgotPassword))
        lblForgotPassword.addGestureRecognizer(tapLblForgotPassword)
    }
    
    @objc func newtoFametale(){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @objc func forgotPassword(){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    //MARK:- ACTIONS
    //MARK:
    
    
    @IBAction func btnRememberMeTapped(_ sender: Any) {
        btnRememberMeState = !btnRememberMeState
        initialSetup()
    }
    
    @IBAction func btnSignInTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func btnFBLoginTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnInstaLoginTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnGoogleLoginTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}

