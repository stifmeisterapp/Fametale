//
//  VideoRateAndCommnetVC.swift
//  Fametale
//
//  Created by Callsoft on 12/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class VideoRateAndCommnetVC: UIViewController {
    
    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var lblNoThanksRef: UILabel!
    @IBOutlet weak var btnRateVideoRef: UIButton!
    
    @IBOutlet weak var fadedView: UIView!
    //MARK:- VARIABLES
    //MARK:
    let gradient = Gradient.singletonGradientObj
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        initialSetup()
        
    }
    //MARK:- METHODS
    //MARK:
    
    @objc func noThahksAction(){
        
        self.dismiss(animated: true, completion: nil)
    }
    //MARK:- ACTIONS
    //MARK:
    
    @IBAction func btnRateTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


//MARK:- Custom Method
//MARK:-
extension VideoRateAndCommnetVC {
    
    func initialSetup(){
        let btnRateVideoGradient = gradient.createBlueGreenGradient(from: btnRateVideoRef.bounds)
        self.btnRateVideoRef.layer.insertSublayer(btnRateVideoGradient, at: 0)
        btnRateVideoRef.layer.cornerRadius = btnRateVideoRef.frame.size.height/2
        btnRateVideoRef.layer.masksToBounds = true
        
        lblNoThanksRef.isUserInteractionEnabled = true // Remember to do this
        let taplblNoThanksRef: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(noThahksAction))
        lblNoThanksRef.addGestureRecognizer(taplblNoThanksRef)
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
    
    
   
}
