//
//  AddTaskViewController.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var tastDescriptionLabel: UITextField!
    @IBOutlet weak var taskTitleLabel: UITextField!
    @IBOutlet weak var hourminuteTextField: UITextField!
    @IBOutlet weak var dayMonthTextField: UITextField!
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        self.dayMonthTextField.delegate = self
        self.hourminuteTextField.delegate = self
    }
    @IBAction func dismissButtonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func approveButtonTap(_ sender: Any) {
        
    }
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Calendar.current.date(byAdding: .year, value: -1, to: Date())
        //ToolBar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        dayMonthTextField.inputAccessoryView = toolbar
        dayMonthTextField.inputView = datePicker
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dayMonthTextField{
            showDatePicker()
        }else{
            showTimePicker()
        }
    }
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dayMonthTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    
    
    func showTimePicker(){
        //Formate Date
        datePicker.datePickerMode = .time
        datePicker.minimumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
        //ToolBar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTimePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTimePicker));
        
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        hourminuteTextField.inputAccessoryView = toolbar
        hourminuteTextField.inputView = datePicker
        
    }
    @objc func doneTimePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        hourminuteTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    @objc func cancelTimePicker(){
        self.view.endEditing(true)
    }
}
