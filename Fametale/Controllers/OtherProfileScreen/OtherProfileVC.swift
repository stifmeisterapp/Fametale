//
//  OtherProfileVC.swift
//  Fametale
//
//  Created by Callsoft on 12/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class OtherProfileVC: UIViewController {
    
    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var tblVideos: UITableView!
    
    @IBOutlet weak var btnFollowRef: UIButton!
    
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
        let btnFollowGradient = gradient.createBlueGreenGradient(from: btnFollowRef.bounds)
        self.btnFollowRef.layer.insertSublayer(btnFollowGradient, at: 0)
        btnFollowRef.layer.cornerRadius = btnFollowRef.frame.size.height/2
        btnFollowRef.layer.masksToBounds = true
        
        self.tblVideos.register(UINib(nibName:"VideosCell",bundle:nil), forCellReuseIdentifier: "VideosCell")
        tblVideos.dataSource = self
        tblVideos.delegate = self
        tblVideos.reloadData()
    }
    
    //MARK:- ACTIONS
    //MARK:
    
    @IBAction func btnNavigationTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnRateProfileTapped(_ sender: Any) {
        let vc  = self.storyboard?.instantiateViewController(withIdentifier: "ProfileRatingVC") as! ProfileRatingVC
        self.present(vc, animated: true, completion: nil)
        
    }
}
//MARK:- EXTENTION OF CLASS
//MARK:
extension OtherProfileVC:UITableViewDelegate,UITableViewDataSource{
    
    
    //TODO:-TABLEVIEW DELEGATES
    //TODO:
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnCount = Int()
        
        returnCount = 5
        
        return returnCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell = UITableViewCell()
        
        let cell : VideosCell = tblVideos.dequeueReusableCell(withIdentifier: "VideosCell", for: indexPath) as! VideosCell
        returnCell = cell
        return returnCell
        
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

