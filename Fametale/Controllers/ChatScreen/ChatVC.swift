//
//  ChatVC.swift
//  Fametale
//
//  Created by Callsoft on 11/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    //MARK:- OUTLETS
    //MARK:
    
  
    
    
    //MARK:- VARIABLE
    //MARK:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMethod()
        
        // Do any additional setup after loading the view.
    }
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialMethod(){
        
    }


    
    //MARK:- ACTIONS
    //MARK:
    @IBAction func btnNavigationTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNewChatTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NewMessageVC") as? NewMessageVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
