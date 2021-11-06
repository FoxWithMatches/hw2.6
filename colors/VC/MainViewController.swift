//
//  MainViewController.swift
//  colors
//
//  Created by Alisa Ts on 05.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func colorChange(for viewColor: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.colorView = view.backgroundColor
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func colorChange(for viewColor: UIColor) {
        view.backgroundColor = viewColor
    }
}



