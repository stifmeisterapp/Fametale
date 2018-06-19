//
//  CategoryTableVC.swift
//  Fametale
//
//  Created by Callsoft on 11/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class CategoryTableVC: UIViewController {
    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var tblCategory: UITableView!
    
    //MARK:- VARIABLES
    //MARK:
    let tagNumber = 1
    
    let nameArray = ["Magician","Musician","Singer"]
    let imageArray = ["magician","musician","singer"]
    let pointArray = ["22,334,123","22,334,543","@22,334,547"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMethod()
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialMethod(){
        self.tblCategory.register(UINib(nibName:"SearchXibs",bundle:nil), forCellReuseIdentifier: "SearchXibs")
        
        tblCategory.dataSource = self
        tblCategory.delegate = self
        tblCategory.reloadData()
        
        
    }
}


//MARK:- EXTENSION OF CLASS
//MARK:
extension CategoryTableVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return nameArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : SearchXibs = tblCategory.dequeueReusableCell(withIdentifier: "SearchXibs", for: indexPath) as! SearchXibs
        cell.lblTitle.text = nameArray[indexPath.row]
        cell.imgSearch.image = UIImage(named: imageArray[indexPath.row])
        cell.lblSubTitle.text = pointArray[indexPath.row]
        return cell
        
    }
    
    
}


