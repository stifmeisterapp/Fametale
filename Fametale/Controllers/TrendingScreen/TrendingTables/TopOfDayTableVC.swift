//
//  TopOfDayTableVC.swift
//  Fametale
//
//  Created by Callsoft on 11/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class TopOfDayTableVC: UIViewController {
    
    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var tblTopOfDayVideos: UITableView!
    
    //MARK:- VARIABLES
    //MARK:
    let imageArray = ["trending_video","videi_img_home","trending_video","videi_img_home","trending_video","videi_img_home"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMethod()
        
        // Do any additional setup after loading the view.
    }
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialMethod(){
        self.tblTopOfDayVideos.register(UINib(nibName:"VideosCell",bundle:nil), forCellReuseIdentifier: "VideosCell")
        tblTopOfDayVideos.dataSource = self
        tblTopOfDayVideos.delegate = self
        tblTopOfDayVideos.reloadData()
    }
    
    @objc func buttonRateVideoPressed(_ sender: AnyObject) {
        let vc  = self.storyboard?.instantiateViewController(withIdentifier: "VideoRateAndCommnetVC") as! VideoRateAndCommnetVC
        self.present(vc, animated: true, completion: nil)
    }
    @objc func buttonCommentPressed(_ sender: AnyObject) {
        let vc  = self.storyboard?.instantiateViewController(withIdentifier: "CommentsVC") as! CommentsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func buttonSharePressed(_ sender: AnyObject) {
        let vc  = self.storyboard?.instantiateViewController(withIdentifier: "ShareScreenVC") as! ShareScreenVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


//MARK:- EXTENTION OF CLASS
//MARK:
extension TopOfDayTableVC:UITableViewDelegate,UITableViewDataSource{
    
    
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
        var returnCell = UITableViewCell()
        
        let cell : VideosCell = tblTopOfDayVideos.dequeueReusableCell(withIdentifier: "VideosCell", for: indexPath) as! VideosCell
        cell.imgVideo.image = UIImage(named: imageArray[indexPath.row])
        cell.btnRatingRef.addTarget(self, action:#selector(buttonRateVideoPressed(_:)), for:.touchUpInside)
        cell.btnCommentRef.addTarget(self, action:#selector(buttonCommentPressed(_:)), for:.touchUpInside)
        cell.btnShareRef.addTarget(self, action:#selector(buttonSharePressed(_:)), for:.touchUpInside)

        returnCell = cell
        return returnCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
}

