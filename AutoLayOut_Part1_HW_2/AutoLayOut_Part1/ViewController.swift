//
//  ViewController.swift
//  AutoLayOut_Part1
//
//  Created by Ahmed Al_Masri on 19/07/2026.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var clean_btn: UIButton!
    @IBOutlet weak var delete_btn: UIButton!
    @IBOutlet weak var save_btn: UIButton!
    @IBOutlet weak var note_TV: UITextView!
    @IBOutlet weak var age_lbl: UILabel!
    @IBOutlet weak var age_slider: UISlider!
    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var person_imageV: UIImageView!
    @IBOutlet weak var fillName_TF: UITextField!
    @IBOutlet weak var email_TF: UITextField!
    
    
    
    
    var fullName:String = ""
    
    var Mobile:String = ""
    
    var email:String = ""
     
    var Graduated:String = "UNGraduated"
    var age:Int = 0
    var notes:String = ""




    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clean_Action(_ sender: Any) {
        fillName_TF.text = ""
        fullName = ""
        mobile.text = ""
        Mobile = ""
        email_TF.text = ""
        email = ""
        age_slider.value = 16
        age = 16
        age_lbl.text = "\(age)"
        note_TV.text = ""
        notes = ""
        print("your person info has been cleared")

    }
    @IBAction func delete_Action(_ sender: Any) {
        fullName = ""
        Mobile = ""
        email = ""
        age = 16
        notes = ""
print("your person info has been reset to defualt value")
        
        
    }
    
    
    @IBAction func save_Action(_ sender: Any) {
        
        fullName  = fillName_TF.text ?? ""
        Mobile = mobile.text ?? ""
        email=email_TF.text ?? ""
        age=Int(age_slider.value)
        notes=note_TV.text
        
        print("yes students has been saved full name is \(fullName) Mobile : \(Mobile), email : \(email)")
        
    }
    
    //eevent Slider
    @IBAction func agevaluechanged_Action(_ sender: Any) {
        // age_lbl.text = "\(age_slider.value)"
        age = Int(age_slider.value)
        age_lbl.text = "\(age)"
    }
    @IBAction func graduated_ValueChanged_action(_ sender: UISwitch) {
        if sender.isOn {
            Graduated = "Graduated"
        } else {
            Graduated = "UNGraduated"
        }
    }
    
    @IBAction func email_valueChanged_Action(_ sender: Any) {
        email = email_TF.text ?? ""
    }
    @IBAction func mobile_valueChanged_Action(_ sender: Any) {
        Mobile = mobile.text ?? ""
    }
    
    @IBAction func fillName_textchanged_Action(_ sender: Any) {
        fullName = fillName_TF.text ?? ""
    }
}

