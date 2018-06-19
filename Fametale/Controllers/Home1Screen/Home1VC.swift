//
//  Home1VC.swift
//  Fametale
//
//  Created by Callsoft on 09/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class Home1VC: UIViewController {
    
    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var tblVideos: UITableView!
    @IBOutlet weak var btnFollowingRef: UIButton!
    @IBOutlet weak var btnTrendingRef: UIButton!
    
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
        btnTrendingRef.layer.cornerRadius = 20
        btnTrendingRef.layer.masksToBounds = true
        self.tblVideos.register(UINib(nibName:"VideosCell",bundle:nil), forCellReuseIdentifier: "VideosCell")
        tblVideos.dataSource = self
        tblVideos.delegate = self
        tblVideos.reloadData()
    }
}
//MARK:- EXTENTION OF CLASS
//MARK:
extension Home1VC:UITableViewDelegate,UITableViewDataSource{
    
    
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
