//
//  ViewController.swift
//  iClimate
//
//  Created by Bakhrom Usmanov on 24/07/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        displayResult(searchTextField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        displayResult(textField)
        return true
    }
    
    func displayResult(_ textField: UITextField){
        if let unwrappedValue = searchTextField.text {
            print(unwrappedValue)
            textField.endEditing(true) //dismiss keyboard
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == ""{
            textField.placeholder = "Type Something"
            return false
        } else {
            return true
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let cityText = textField.text{
            weatherManager.fetchWeather(cityName: cityText)
            textField.text = nil
        }
    }
    
    
}
