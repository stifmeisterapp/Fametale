//
//  CommentsVC.swift
//  Fametale
//
//  Created by Callsoft on 09/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class CommentsVC: UIViewController {
    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var viewBottomComment: UIView!
    @IBOutlet weak var tblComments: UITableView!
    
    //MARK:- VARIABLE
    //MARK:
    let gradient = Gradient.singletonGradientObj
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()

        // Do any additional setup after loading the view.
    }
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialSetup(){
        let viewBottomCommentGradient = gradient.createBlueGreenGradient(from: viewBottomComment.bounds)
        self.viewBottomComment.layer.insertSublayer(viewBottomCommentGradient, at: 0)
        viewBottomComment.layer.masksToBounds = true
        tblComments.dataSource = self
        tblComments.delegate = self
        tblComments.reloadData()
    }
    //MARK:- ACTIONS
    //MARK:
    
    @IBAction func btnNavigationTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
//MARK:- EXTENTION OF CLASS
//MARK:
extension CommentsVC:UITableViewDelegate,UITableViewDataSource{
    
    
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
       let cell = tblComments.dequeueReusableCell(withIdentifier: "CommentsCell", for: indexPath) as! CommentsCell
        return cell
        
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

