//
//  HomeVC.swift
//  Fametale
//
//  Created by Callsoft on 09/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var tblVideos: UITableView!
    @IBOutlet weak var btnFollowingRef: UIButton!
    @IBOutlet weak var btnTrendingRef: UIButton!
   
    @IBOutlet weak var imgButton: UIImageView!
    //MARK:- VARIABLES
    //MARK:
    let imageArray1 = ["trending_video","videi_img_home","trending_video","videi_img_home","trending_video","videi_img_home","trending_video"]
     let imageArray2 = ["videi_img_home","trending_video","videi_img_home","trending_video","videi_img_home","trending_video","trending_video"]
    
    var tagIndex = Int()
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
    @IBAction func btnTrendingTapped(_ sender: Any) {
        tagIndex = (sender as AnyObject).tag
        btnFollowingRef.setTitleColor(UIColor(red: 67.0/255.0, green: 67.0/255.0, blue: 67.0/255.0, alpha: 1.0), for: .normal)
        btnTrendingRef.setTitleColor(UIColor.white, for: .normal)
        imgButton.image = UIImage(named: "trending_fametale")
        tblVideos.reloadData()
    }
    
    @IBAction func btnFollowingTapped(_ sender: Any) {
        tagIndex = (sender as AnyObject).tag
        btnFollowingRef.setTitleColor(UIColor.white, for: .normal)
        btnTrendingRef.setTitleColor(UIColor(red: 67.0/255.0, green: 67.0/255.0, blue: 67.0/255.0, alpha: 1.0), for: .normal)
        imgButton.image = UIImage(named: "following_fametale")
        tblVideos.reloadData()
    }
    
    

}
    //MARK:- EXTENTION OF CLASS
    //MARK:
    extension HomeVC:UITableViewDelegate,UITableViewDataSource{
        
        
        //TODO:-TABLEVIEW DELEGATES
        //TODO:
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            var returnCount = Int()
            if tagIndex == 1{
             returnCount = imageArray1.count
            }
            else if tagIndex == 2{
            returnCount = imageArray2.count
            }
            else{
                returnCount = imageArray1.count
            }
            return returnCount
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var returnCell = UITableViewCell()
            if tagIndex == 1{
                
                let cell : VideosCell = tblVideos.dequeueReusableCell(withIdentifier: "VideosCell", for: indexPath) as! VideosCell
                cell.btnRatingRef.addTarget(self, action:#selector(buttonRateVideoPressed(_:)), for:.touchUpInside)
                cell.btnCommentRef.addTarget(self, action:#selector(buttonCommentPressed(_:)), for:.touchUpInside)
                cell.btnShareRef.addTarget(self, action:#selector(buttonSharePressed(_:)), for:.touchUpInside)
                 cell.imgVideo.image = UIImage(named: imageArray1[indexPath.row])
                returnCell = cell
            }
            else if tagIndex == 2{
                let cell : VideosCell = tblVideos.dequeueReusableCell(withIdentifier: "VideosCell", for: indexPath) as! VideosCell
                cell.btnRatingRef.addTarget(self, action:#selector(buttonRateVideoPressed(_:)), for:.touchUpInside)
                cell.btnCommentRef.addTarget(self, action:#selector(buttonCommentPressed(_:)), for:.touchUpInside)
                cell.btnShareRef.addTarget(self, action:#selector(buttonSharePressed(_:)), for:.touchUpInside)
                cell.imgVideo.image = UIImage(named: imageArray2[indexPath.row])
                returnCell = cell
            }else{
                let cell : VideosCell = tblVideos.dequeueReusableCell(withIdentifier: "VideosCell", for: indexPath) as! VideosCell
                cell.btnRatingRef.addTarget(self, action:#selector(buttonRateVideoPressed(_:)), for:.touchUpInside)
                cell.btnCommentRef.addTarget(self, action:#selector(buttonCommentPressed(_:)), for:.touchUpInside)
                cell.btnShareRef.addTarget(self, action:#selector(buttonSharePressed(_:)), for:.touchUpInside)
                cell.imgVideo.image = UIImage(named: imageArray1[indexPath.row])
                returnCell = cell
                
            }
            return returnCell
            
        }
        
        func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return UITableViewAutomaticDimension
        }
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableViewAutomaticDimension
        }
        
    }

