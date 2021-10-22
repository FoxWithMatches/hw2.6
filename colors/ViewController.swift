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
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.tintColor = .green
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.tintColor = .blue
        
        currentRed.text = String(redSlider.value)
        currentGreen.text = String(greenSlider.value)
        currentBlue.text = String(blueSlider.value)
        
        view.backgroundColor = .lightGray
    }
    
    func colorChange() {
        viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func changeRGB() {
        colorChange()
    }
    
    @IBAction func redCurrentValue() {
        currentRed.text = String(redSlider.value)
    }
    
    @IBAction func greenCurrentValue() {
        currentGreen.text = String(greenSlider.value)
        
    }
    
    @IBAction func blueCurrentValue() {
        currentBlue.text = String(blueSlider.value)
    }
    
}

