//
//  Chat2VC.swift
//  Fametale
//
//  Created by Callsoft on 11/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class Chat2VC: UIViewController {
    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var viewBottomChat: UIView!
    
    //MARK:- VARIABLE
    //MARK:
    let gradient = Gradient.singletonGradientObj
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
        // Do any additional setup after loading the view.
    }
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialSetup(){
        let viewBottomChatGradient = gradient.createBlueGreenGradient(from: viewBottomChat.bounds)
        self.viewBottomChat.layer.insertSublayer(viewBottomChatGradient, at: 0)
        viewBottomChat.layer.masksToBounds = true
    }
    
}
