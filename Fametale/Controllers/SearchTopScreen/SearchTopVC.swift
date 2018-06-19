//
//  SearchTopVC.swift
//  Fametale
//
//  Created by Callsoft on 11/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class SearchTopVC: UIViewController {
    
    
    
    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var viewCategories: UIView!
    @IBOutlet weak var viewTags: UIView!
    @IBOutlet weak var viewTopProfile: UIView!
    @IBOutlet weak var btnCategoriesRef: UIButton!
    @IBOutlet weak var btnTagsRef: UIButton!
    @IBOutlet weak var btnTopProfileRef: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK:- VARIABLES
    //MARK:
    let gradient = Gradient.singletonGradientObj
    var _currentPage: NSInteger = 0
    var _page: NSInteger = 0
    var selectedScrollIndex = 0
    var selectedIndex:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedScrollSetup()
    }
    
    
    //MARK:- METHODS
    //MARK:
    func animatedScrollSetup(){
        
        self.scrollView.contentSize = CGSize(width: 3*self.view.frame.width,height: self.scrollView.frame.height)
        self.addChildViewController((self.storyboard?.instantiateViewController(withIdentifier: "TopTableVC"))! as! TopTableVC)
        self.addChildViewController((self.storyboard?.instantiateViewController(withIdentifier: "TagTableVC"))! as! TagTableVC)
        self.addChildViewController((self.storyboard?.instantiateViewController(withIdentifier: "CategoryTableVC"))! as! CategoryTableVC)
        self.loadScrollView()
        
        
        
    }
    //TODO:- Updating UI's
    func changeControlls(btnSeleted:UIButton,selectedView:UIView){
        btnSeleted.setTitleColor(UIColor(red: 74.0/255, green: 192.0/255, blue: 194.0/255, alpha: 1.0), for: .normal)
        
        selectedView.backgroundColor = UIColor(red: 74.0/255, green: 192.0/255, blue: 194.0/255, alpha: 1.0)
        
    }
    
    
    func updatingTopButtonsUI(btnRef1:UIButton,btnRef2: UIButton,viewRef1:UIView,viewRef2:UIView){
        //1--------------------------------------//
        btnRef1.setTitleColor(UIColor(red: 154.0/255, green: 154.0/255, blue: 154.0/255, alpha: 1.0), for: .normal)
        viewRef1.backgroundColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 239.0/255, alpha: 1.0)
        
        //2--------------------------------------//
        btnRef2.setTitleColor(UIColor(red: 154.0/255, green: 154.0/255, blue: 154.0/255, alpha: 1.0), for: .normal)
        viewRef2.backgroundColor = UIColor(red: 239.0/255, green: 239.0/255, blue: 239.0/255, alpha: 1.0)
        
        
    }
    
    
    //TODO:- Scroll Animation
    func loadScrollView ()
    {
        _currentPage=0;
        _page = 0;
        for index in 0 ..< self.childViewControllers.count
        {
            self.loadScrollViewWithPage(index);
        }
    }
    
    
    
    func loadScrollViewWithPage(_ page : Int) -> Void
    {
        if(page < 0)
        {
            return
        }
        if page >= self.childViewControllers.count
        {
            return
        }
        let viewController: UIViewController? = (self.childViewControllers as NSArray).object(at: page) as? UIViewController
        if(viewController == nil)
        {
            return
        }
        if(viewController?.view.superview == nil)
        {
            var frame: CGRect  = self.scrollView.frame
            frame.origin.x = self.view.frame.width*CGFloat(page)
            frame.origin.y = 0;
            viewController?.view.frame = frame;
            self.scrollView.addSubview(viewController!.view);
        }
    }
    
    
    
    //MARK:- ACTIONS
    //MARK:
    
    @IBAction func btnNavigationTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnTopProfileTapped(_ sender: Any) {
        changeControlls(btnSeleted:btnTopProfileRef,selectedView:viewTopProfile)
        updatingTopButtonsUI(btnRef1:btnTagsRef,btnRef2:btnCategoriesRef,viewRef1:viewTags,viewRef2:viewCategories)
        animateScrollViewHorizontally(destinationPoint: CGPoint(x: 0  * self.view.frame.width, y: 0), andScrollView: self.scrollView, andAnimationMargin: 0);
    }
    
    
    @IBAction func btnTagsTapped(_ sender: Any) {
        changeControlls(btnSeleted:btnTagsRef,selectedView:viewTags)
        updatingTopButtonsUI(btnRef1:btnTopProfileRef,btnRef2:btnCategoriesRef,viewRef1:viewTopProfile,viewRef2:viewCategories)
        animateScrollViewHorizontally(destinationPoint: CGPoint(x: 1 * self.view.frame.width, y: 0), andScrollView: self.scrollView, andAnimationMargin: 0);
    }
    
    @IBAction func btnCategoriesTapped(_ sender: Any) {
        changeControlls(btnSeleted:btnCategoriesRef,selectedView:viewCategories)
        updatingTopButtonsUI(btnRef1:btnTopProfileRef,btnRef2:btnTagsRef,viewRef1:viewTopProfile,viewRef2:viewTags)
        animateScrollViewHorizontally(destinationPoint: CGPoint(x: 2 * self.view.frame.width, y: 0), andScrollView: self.scrollView, andAnimationMargin: 0);
    }


    
    
    
    
    
}
