//
//  ForgotPasswordVC.swift
//  Fametale
//
//  Created by Callsoft on 09/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var btnSendRef: UIButton!
    
    //MARK:- VARIABLE
    //MARK:
    let gradient = Gradient.singletonGradientObj
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMethod()

        // Do any additional setup after loading the view.
    }
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialMethod(){
        let signUpButtonGradient = gradient.createBlueGreenGradient(from: btnSendRef.bounds)
        self.btnSendRef.layer.insertSublayer(signUpButtonGradient, at: 0)
        btnSendRef.layer.cornerRadius = 5
        btnSendRef.layer.masksToBounds = true
    }
    
    //MARK:- OUTLETS
    //MARK:
    
    @IBAction func btnNavigationTapped(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func btnSendTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInVC") as? SignInVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
