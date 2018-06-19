//
//  ProfileVC.swift
//  Fametale
//
//  Created by Callsoft on 11/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var tblVideos: UITableView!

    
    //MARK:- VARIABLES
    //MARK:
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMethod()
        
        // Do any additional setup after loading the view.
    }
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialMethod(){
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
    @IBAction func btnContactsTappd(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchTopVC") as? SearchTopVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnEditProfileTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EditProfileVC") as? EditProfileVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnContactTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MyContactsVC") as? MyContactsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
//MARK:- EXTENTION OF CLASS
//MARK:
extension ProfileVC:UITableViewDelegate,UITableViewDataSource{
    
    
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

