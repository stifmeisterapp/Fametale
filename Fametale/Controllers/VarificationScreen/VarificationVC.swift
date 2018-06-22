//
//  VarificationVC.swift
//  Fametale
//
//  Created by Callsoft on 08/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class VarificationVC: UIViewController {
    
    
    
    @IBOutlet weak var otpView: VPMOTPView!
    
    var enteredOtp: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMethod()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- USER DEFINED METHODS
    //MARK:
    
    //TODO:- INITIAL METHOD
    func initialMethod(){
        otpView.otpFieldsCount = 4
        otpView.otpFieldDefaultBorderColor = UIColor.blue
        otpView.otpFieldEnteredBorderColor = UIColor.green
        otpView.otpFieldErrorBorderColor = UIColor.red
        otpView.otpFieldBorderWidth = 2
        otpView.delegate = self
        
        // Create the UI
        otpView.initalizeUI()
        
        
        
    }
    //MARK:- ACTIONS
    //MARK:
    
    @IBAction func btnNavigationTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension VarificationVC: VPMOTPViewDelegate {
    func hasEnteredAllOTP(hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
//let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
//        self.navigationController?.pushViewController(vc!, animated: true)
        
        return enteredOtp == "1234"
    }
    
    func shouldBecomeFirstResponderForOTP(otpFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otpString: String) {
        enteredOtp = otpString
        print("OTPString: \(otpString)")
    }
}

