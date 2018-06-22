//
//  ProfileRatingVC.swift
//  Fametale
//
//  Created by Callsoft on 12/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class ProfileRatingVC: UIViewController {

    //MARK:- OUTLETS
    //MARK:
    @IBOutlet weak var fadedView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- METHODS
    //MARK:
    func initialMethod(){
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            
            fadedView.backgroundColor = .clear
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.fadedView.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            fadedView.addSubview(blurEffectView)
            
        }else{
            view.backgroundColor = .black
        }
        
    }
    
    @IBAction func btnActionTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}



