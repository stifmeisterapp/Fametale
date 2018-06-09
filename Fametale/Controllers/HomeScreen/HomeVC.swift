//
//  HomeVC.swift
//  Fametale
//
//  Created by Callsoft on 09/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var btnFollowingRef: UIButton!
    @IBOutlet weak var btnTrendingRef: UIButton!
    @IBOutlet weak var viewButtonsRef: UIView!
    //MARK:- VARIABLES
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
        let btnTrendingRefGradient = gradient.createBlueGreenGradient(from: btnTrendingRef.bounds)
        self.btnTrendingRef.layer.insertSublayer(btnTrendingRefGradient, at: 0)
        btnTrendingRef.layer.cornerRadius = 25
        btnTrendingRef.layer.masksToBounds = true
    }

}
