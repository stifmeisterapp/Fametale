//
//  TagTableVC.swift
//  Fametale
//
//  Created by Callsoft on 11/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class TagTableVC: UIViewController {
    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var tagTable: UITableView!
    
    //MARK:- VARIABLES
    //MARK:
    let tagNumber = 1
    
    let nameArray = ["iOSTutorial","Mark","Man","Android"]
    let pointArray = ["22,334,123","22,334,543","@22,334,547","22,334,643"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMethod()
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialMethod(){
        self.tagTable.register(UINib(nibName:"SearchXibs",bundle:nil), forCellReuseIdentifier: "SearchXibs")
        
        tagTable.dataSource = self
        tagTable.delegate = self
        tagTable.reloadData()
        
        
    }
}
//MARK:- EXTENSION OF CLASS
//MARK:
extension TagTableVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return nameArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : SearchXibs = tagTable.dequeueReusableCell(withIdentifier: "SearchXibs", for: indexPath) as! SearchXibs
        cell.lblTitle.text = "#\(nameArray[indexPath.row])"
        cell.lblSubTitle.text = "\(pointArray[indexPath.row]) points"
        return cell
        
    }
    
    
}

