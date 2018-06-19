//
//  MoreVC.swift
//  Fametale
//
//  Created by Callsoft on 11/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class MoreVC: UIViewController {
    //MARK:- OUTLETS
    //MARK:
    @IBOutlet weak var tblMore: UITableView!
    
    //MARK:- VARIABLE
    //MARK:
    let titleArray = ["User Profile","About Fametale","Contact Fametale","Rate Fametale","Privacy Policy","Terms and Conditions","Log Out"]
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
        // Do any additional setup after loading the view.
    }
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialSetup(){
        tblMore.dataSource = self
        tblMore.delegate = self
        tblMore.reloadData()
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
extension MoreVC:UITableViewDelegate,UITableViewDataSource{
    
    
    //TODO:-TABLEVIEW DELEGATES
    //TODO:
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnCount = Int()
        
        returnCount = titleArray.count
        
        return returnCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblMore.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath) as! MoreTableViewCell
        cell.lblTitle.text = titleArray[indexPath.row]
        if indexPath.row == 6{
          cell.imgTap.image = UIImage(named: "logout")
        }
        return cell
        
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }else if indexPath.row == 1{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AboutFametaleScreen") as? AboutFametaleScreen
            self.navigationController?.pushViewController(vc!, animated: true)
        }else if indexPath.row == 2{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContactUsVC") as? ContactUsVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }else if indexPath.row == 3{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RateVC") as? RateVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }else if indexPath.row == 4{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PrivacyAndPolicyVC") as? PrivacyAndPolicyVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }else if indexPath.row == 5{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TermsAndConditionsVC") as? TermsAndConditionsVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }else{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInVC") as? SignInVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
}

