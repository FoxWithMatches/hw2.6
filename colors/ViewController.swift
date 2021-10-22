//
//  ViewController.swift
//  colors
//
//  Created by Alisa Ts on 22.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redlabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var currentRed: UILabel!
    @IBOutlet var currentGreen: UILabel!
    @IBOutlet var currentBlue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redlabel.text = "Red"
        greenLabel.text = "Green"
        blueLabel.text = "Blue"
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.tintColor = .red
        redSlider.value = 0
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.tintColor = .green
        greenSlider.value = 0
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.tintColor = .blue
        blueSlider.value = 0
        
        currentRed.text = String(round(redSlider.value * 100) / 100.0)
        currentGreen.text = String(round(greenSlider.value * 100) / 100.0)
        currentBlue.text = String(round(blueSlider.value * 100) / 100.0)
        
        view.backgroundColor = .lightGray //фон приложения
    }
    
    func colorChange() {
        viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func changeRGB() {
        colorChange()
    }
    
    @IBAction func redCurrentValue() {
        currentRed.text = String(round(redSlider.value * 100) / 100.0)
    }
    
    @IBAction func greenCurrentValue() {
        currentGreen.text = String(round(greenSlider.value * 100) / 100.0)
    }
    
    @IBAction func blueCurrentValue() {
        currentBlue.text = String(round(blueSlider.value * 100) / 100.0)
    }
    
}

