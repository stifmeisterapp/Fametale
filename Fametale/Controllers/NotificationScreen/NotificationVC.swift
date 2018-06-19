//
//  NotificationVC.swift
//  Fametale
//
//  Created by Callsoft on 11/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {
    //MARK:- OUTLETS
    //MARK:
    @IBOutlet weak var tblNotification: UITableView!
    
    //MARK:- VARIABLE
    //MARK:
    let imageArray = ["img_a_notification","img_b_notification","img_c_notification","img_d_notification"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
        // Do any additional setup after loading the view.
    }
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialSetup(){
        tblNotification.dataSource = self
        tblNotification.delegate = self
        tblNotification.reloadData()
    }
    
    //MARK:- ACTIONS
    //MARK:
    @IBAction func btnSearchTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchTopVC") as? SearchTopVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
    @IBAction func btnChatTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChatVC") as? ChatVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
//MARK:- EXTENTION OF CLASS
//MARK:
extension NotificationVC:UITableViewDelegate,UITableViewDataSource{
    
    
    //TODO:-TABLEVIEW DELEGATES
    //TODO:
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnCount = Int()
        
        returnCount = imageArray.count
        
        return returnCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblNotification.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
        cell.imgNotification.image = UIImage(named: imageArray[indexPath.row])
        return cell
        
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

