//
//  ViewController.swift
//  colors
//
//  Created by Alisa Ts on 22.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var currentRed: UILabel!
    @IBOutlet var currentGreen: UILabel!
    @IBOutlet var currentBlue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    weak var delegate: SettingsViewControllerDelegate!
    var colorView: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.backgroundColor = colorView

        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
                
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        
        viewColor.layer.cornerRadius = 10
        view.backgroundColor = .lightGray
        
        addDoneButton(for: redTF)
        addDoneButton(for: greenTF)
        addDoneButton(for: blueTF)
        
        slidersChange()
        colorChange()
        
        redTF.text = String(round(redSlider.value * 100) / 100.0)
        greenTF.text = String(round(greenSlider.value * 100) / 100.0)
        blueTF.text = String(round(blueSlider.value * 100) / 100.0)
        
        currentRed.text = String(round(redSlider.value * 100) / 100.0)
        currentGreen.text = String(round(greenSlider.value * 100) / 100.0)
        currentBlue.text = String(round(blueSlider.value * 100) / 100.0)
    }
    
    @IBAction func changeRGB() {
        colorChange()
    }
    
    @IBAction func redCurrentValue() {
        currentRed.text = String(round(redSlider.value * 100) / 100.0)
        redTF.text = String(round(redSlider.value * 100) / 100.0)
    }
    
    @IBAction func greenCurrentValue() {
        currentGreen.text = String(round(greenSlider.value * 100) / 100.0)
        greenTF.text = String(round(greenSlider.value * 100) / 100.0)
        
    }
    
    @IBAction func blueCurrentValue() {
        currentBlue.text = String(round(blueSlider.value * 100) / 100.0)
        blueTF.text = String(round(blueSlider.value * 100) / 100.0)
        
    }
    
    @IBAction func doneBtn() {
        view.endEditing(true)
        colorChange()
        delegate.colorChange(for: viewColor.backgroundColor ?? .black)
        dismiss(animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue), numberValue <= 1 else {
            showAlert(title: "Wrong format!",
                      message: "Use type 'Float' and values from 0.0 to 0.99")
            return
        }
        
        if textField == redTF {
            redSlider.value = numberValue
        } else if textField == greenTF {
            greenSlider.value = numberValue
        } else if textField == blueTF {
            blueSlider.value = numberValue
        }
        
        currentRed.text = String(round(redSlider.value * 100) / 100.0)
        currentGreen.text = String(round(greenSlider.value * 100) / 100.0)
        currentBlue.text = String(round(blueSlider.value * 100) / 100.0)
        
        colorChange()
    }
}

extension SettingsViewController {
    
    private func colorChange() {
        viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    private func slidersChange() {
        let ciColor = CIColor(color: colorView)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func addDoneButton(for textField: UITextField) {
        let numberToolbar = UIToolbar()
        textField.inputAccessoryView = numberToolbar
        numberToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(doneButtonAction))
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        numberToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc private func doneButtonAction() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

