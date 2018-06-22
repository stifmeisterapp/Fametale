//
//  EditProfileVC.swift
//  Fametale
//
//  Created by Callsoft on 11/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit
import DropDown


class EditProfileVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //MARK:- OUTLETS
    //MARK:
   
    @IBOutlet weak var imgViewProfile: UIImageView!
    @IBOutlet weak var lblTermAndCodition: UILabel!
    @IBOutlet weak var viewPasswordContainer: UIView!
    @IBOutlet weak var imgDropDown: UIImageView!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var viewGender: UIView!
    
    //MARK:- VARIABLE
    //MARK:
     let genderDropDown = DropDown()
    
    var imagePicker = UIImagePickerController()
    var imageData = NSData()
    
    var btnChangePasswordState = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMethod()

        // Do any additional setup after loading the view.
    }
    //MARK:- METHODS
    //MARK:
    func initialMethod(){
        
        imagePicker.allowsEditing =  true
        if btnChangePasswordState == false{
            viewPasswordContainer.isHidden = true
            imgDropDown.image = #imageLiteral(resourceName: "drop_down_edit")
        }
        
        
        
        
        let text1 = lblTermAndCodition.text
        let textRange1 = NSRange(location: 5, length: 19)
        var attributedText1 = NSMutableAttributedString(string: text1!)
        attributedText1.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: textRange1)
        attributedText1.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red: 74.0/255, green: 192.0/255, blue: 194.0/255, alpha: 1.0), range: textRange1)
        
        
        lblTermAndCodition.attributedText = attributedText1
        
        lblTermAndCodition.isUserInteractionEnabled = true // Remember to do this
        let lblAlreadyHaveAccountTap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(lblTermsAndCondtionsTapped))
        lblTermAndCodition.addGestureRecognizer(lblAlreadyHaveAccountTap)
        
    }
    
    
    // MARK:- IMAGEPICKER DELEGATE
    //MARK:-
    
    func openActionSheet() {
        
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in
        }
        
        imagePicker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func openCamera() {
        
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            self .present(imagePicker, animated: true, completion: nil)
        }else {
            
            let alert = UIAlertController(title: "FameTale", message: "You don't have camera", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery() {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imagePicker .dismiss(animated: true, completion: nil)
        
        let chosenImage = info[UIImagePickerControllerEditedImage] as? UIImage
        
        imageData = UIImageJPEGRepresentation(chosenImage!, 0.5) as NSData!
        
        imgViewProfile.image = chosenImage
        imgViewProfile.layer.cornerRadius = imgViewProfile.frame.size.width/2
        imgViewProfile.clipsToBounds = true
        
        //UserDefaults.standard.set(imageData, forKey: "imageData")
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePicker = UIImagePickerController()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    @objc func lblTermsAndCondtionsTapped(){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TermsAndConditionsVC") as? TermsAndConditionsVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }


    //MARK:- ACTIONS
    //MARK:
    
    
    
    @IBAction func btnCameraTapped(_ sender: Any) {
        openActionSheet()
    }
    
    @IBAction func btnNavigationTapped(_ sender: Any) {
        if (sender as AnyObject).tag == 1{
            
            self.navigationController?.popViewController(animated: true)
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func btnGenderTapped(_ sender: Any) {
        self.genderDropDown.anchorView = viewGender
        genderDropDown.dataSource = ["MALE", "FEMALE", "OTHERS"]
        genderDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.txtGender.text = item
            //            print("Selected item: \(item) at index: \(index)")
        }
        
        genderDropDown.show()
    }
    
    
    @IBAction func btnChangePasswordTapped(_ sender: Any) {
        if btnChangePasswordState == false{
            viewPasswordContainer.isHidden = true
            imgDropDown.image = #imageLiteral(resourceName: "drop_down_edit")
            btnChangePasswordState = !btnChangePasswordState
        }
        else{
            viewPasswordContainer.isHidden = false
            imgDropDown.image = #imageLiteral(resourceName: "drop_up_edit")
            btnChangePasswordState = !btnChangePasswordState
        }
    }
    
    
    
}
