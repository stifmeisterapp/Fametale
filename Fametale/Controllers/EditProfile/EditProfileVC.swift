//
//  EditProfileVC.swift
//  Fametale
//
//  Created by Callsoft on 11/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK:- ACTIONS
    //MARK:
    @IBAction func btnNavigationTapped(_ sender: Any) {
        if (sender as AnyObject).tag == 1{
            
            self.navigationController?.popViewController(animated: true)
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
