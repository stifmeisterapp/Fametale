//
//  NewMessageVC.swift
//  Fametale
//
//  Created by Callsoft on 11/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class NewMessageVC: UIViewController {
    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var tblNewMessage: UITableView!
    
    //MARK:- VARIABLES
    //MARK:
    let tagNumber = 1
    
    let nameArray = ["Wade Wilson","Nicolas cage","Kate upton","Chris Pratt"]
    let imageArray = ["img_a_notification","img_b_notification","img_c_notification","img_d_notification"]
    let idArray = ["@deadpool","@ghostrider","@bugsbunny","@starlord"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMethod()
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialMethod(){
        self.tblNewMessage.register(UINib(nibName:"SearchXibs",bundle:nil), forCellReuseIdentifier: "SearchXibs")
        
        tblNewMessage.dataSource = self
        tblNewMessage.delegate = self
        tblNewMessage.reloadData()
        
        
    }
    
    
    
    @IBAction func btnNavigationTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- EXTENSION OF CLASS
//MARK:
extension NewMessageVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return nameArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : SearchXibs = tblNewMessage.dequeueReusableCell(withIdentifier: "SearchXibs", for: indexPath) as! SearchXibs
        cell.lblTitle.text = nameArray[indexPath.row]
        cell.imgSearch.image = UIImage(named: imageArray[indexPath.row])
        cell.lblSubTitle.text = idArray[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
}

