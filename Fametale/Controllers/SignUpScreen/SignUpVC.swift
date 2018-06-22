//
//  SignUpVC.swift
//  Fametale
//
//  Created by Callsoft on 08/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit
import DropDown

class SignUpVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //MARK:- OUTLETS
    //MARK:
    
    @IBOutlet weak var imgViewProfile: UIImageView!
    @IBOutlet weak var lblTermsAndCondtions: UILabel!
    @IBOutlet weak var txtConfirmPasswordRef: UITextField!
    @IBOutlet weak var txtPasswordRef: UITextField!
    @IBOutlet weak var btnConfirmPasswordRef: UIButton!
    @IBOutlet weak var btnPasswordRef: UIButton!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var btnTermsAndConditionsRef: UIButton!
    @IBOutlet weak var btnSignUpRef: UIButton!
    @IBOutlet weak var lblAlreadyHaveAccount: UILabel!
    
    @IBOutlet weak var viewGender: UIView!
    //MARK:- VARIABLE
    //MARK:
    let gradient = Gradient.singletonGradientObj
    var btnAcceptTermsAndConditionState = false
    let genderDropDown = DropDown()
    var btnPasswordState = false
    var btnConfirmPasswordState = false
    
    
    var imagePicker = UIImagePickerController()
    var imageData = NSData()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMethod()
        
        
        
        // Do any additional setup after loading the view.
    }
    //MARK:- USER DEFINED METHODS
    //MARK:
    func initialMethod(){
        imagePicker.allowsEditing =  true
        
        if btnAcceptTermsAndConditionState == false{
            btnTermsAndConditionsRef.setImage(#imageLiteral(resourceName: "remember_unselected"), for: .normal)
        }
        else{
            btnTermsAndConditionsRef.setImage(#imageLiteral(resourceName: "remember_selected"), for: .normal)
        }
        
        
        let signUpButtonGradient = gradient.createBlueGreenGradient(from: btnSignUpRef.bounds)
        self.btnSignUpRef.layer.insertSublayer(signUpButtonGradient, at: 0)
        btnSignUpRef.layer.cornerRadius = 5
        btnSignUpRef.layer.masksToBounds = true
        let text = lblAlreadyHaveAccount.text
        let textRange = NSRange(location: 25, length: 7)
        var attributedText = NSMutableAttributedString(string: text!)
        attributedText.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: textRange)
        attributedText.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red: 74.0/255, green: 192.0/255, blue: 194.0/255, alpha: 1.0), range: textRange)
        lblAlreadyHaveAccount.attributedText = attributedText
        
        lblAlreadyHaveAccount.isUserInteractionEnabled = true // Remember to do this
        let tapLblAlreadyHaveAccount: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(lblAlreadyHaveAccountTapped))
        lblAlreadyHaveAccount.addGestureRecognizer(tapLblAlreadyHaveAccount)
        
        
        
        
        let text1 = lblTermsAndCondtions.text
        let textRange1 = NSRange(location: 17, length: 20)
        var attributedText1 = NSMutableAttributedString(string: text1!)
        attributedText1.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: textRange1)
        attributedText1.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red: 74.0/255, green: 192.0/255, blue: 194.0/255, alpha: 1.0), range: textRange1)
        
        
       lblTermsAndCondtions.attributedText = attributedText1
        
        lblTermsAndCondtions.isUserInteractionEnabled = true // Remember to do this
        let lblAlreadyHaveAccountTap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(lblTermsAndCondtionsTapped))
        lblTermsAndCondtions.addGestureRecognizer(lblAlreadyHaveAccountTap)
        
        
        
        
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
        
        
        
        imagePicker.dismiss(animated: true, completion: nil)
        
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
    
    
    
    @objc func lblAlreadyHaveAccountTapped(){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInVC") as? SignInVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @objc func lblTermsAndCondtionsTapped(){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TermsAndConditionsVC") as? TermsAndConditionsVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    //MARK:- ACTION
    //MARK:
    
    @IBAction func btnCameraTapped(_ sender: Any) {
        openActionSheet()
    }
    
    
    @IBAction func btnPasswordEyeTapped(_ sender: Any) {
        if (sender as AnyObject).tag == 1{
            if btnPasswordState == false{
                // btnPasswordRef.setImage(, for: .normal)
                txtPasswordRef.isSecureTextEntry = false
                btnPasswordState = !btnPasswordState
            }
            else{
                // btnPasswordRef.setImage(, for: .normal)
                txtPasswordRef.isSecureTextEntry = true
                btnPasswordState = !btnPasswordState
            }
            
        }
        else if (sender as AnyObject).tag == 2{
            if btnConfirmPasswordState == false{
                // btnConfirmPasswordRef.setImage(, for: .normal)
                txtConfirmPasswordRef.isSecureTextEntry = false
                btnConfirmPasswordState = !btnConfirmPasswordState
            }
            else{
                // btnConfirmPasswordRef.setImage(, for: .normal)
                txtConfirmPasswordRef.isSecureTextEntry = true
                btnConfirmPasswordState = !btnConfirmPasswordState
            }
        }
    }
    
    @IBAction func btnGenderDropDownTapped(_ sender: Any) {
        self.genderDropDown.anchorView = viewGender
        genderDropDown.dataSource = ["MALE", "FEMALE", "OTHERS"]
        genderDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.txtGender.text = item
            //            print("Selected item: \(item) at index: \(index)")
        }
        
        genderDropDown.show()
    }
    
    @IBAction func btnTermsAndConditionsTapped(_ sender: Any) {
        btnAcceptTermsAndConditionState = !btnAcceptTermsAndConditionState
        initialMethod()
    }
    
    
    @IBAction func btnSignUpTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "VarificationVC") as? VarificationVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

