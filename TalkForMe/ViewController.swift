//
//  ViewController.swift
//  TalkForMe
//
//  Created by Eric Hernandez on 12/24/18.
//  Copyright © 2018 Eric Hernandez. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController {

    var dataSource = ["Hi Aiva!","How was your winter break?","I hope you had a wonderful Christmas","Thank you.","Your welcome!","I had fun with my family over the winter break"]
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var enterTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    func readMe( myText: String) {
        let utterance = AVSpeechUtterance(string: myText )
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    @IBAction func sayItBtn(_ sender: Any) {
        readMe(myText: enterTxt.text!)
    }
    @IBAction func addBtn(_ sender: Any) {
        dataSource.append(enterTxt.text!)
        self.pickerView .reloadAllComponents()
        readMe(myText: enterTxt.text!)
    }
    @IBAction func deleteBtn(_ sender: Any) {
        dataSource = dataSource.filter {$0 != enterTxt.text}
        self.pickerView .reloadAllComponents()
      
    }
    
}
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        enterTxt.text = dataSource[row]
        readMe(myText: dataSource[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}

