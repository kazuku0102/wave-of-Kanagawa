//
//  ViewController.swift
//  wave of Kanagawa
//
//  Created by 蕭聿莘 on 2020/1/4.
//  Copyright © 2020 Kazuku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wavePic: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var gradientSilder: UISlider!
    @IBOutlet weak var redomButton: UIButton!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSeitch: UISwitch!
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var alphaValue: UILabel!
    @IBOutlet weak var gradientView: UIView!
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if redSwitch.isOn {
            redSlider.isEnabled = true
        }else{
            redSlider.isEnabled = false
        }
        if greenSwitch.isOn{
            greenSlider.isEnabled = true
        }else{
            greenSlider.isEnabled = false
        }
        if blueSeitch.isOn {
            blueSlider.isEnabled = true
        }else{
            blueSlider.isEnabled = false
        }
        
        //設定RGB三個開關為On，隨機才會啟動
        if redSwitch.isOn,greenSwitch.isOn,blueSeitch.isOn{
            redomButton.isEnabled = true
        }else{
            redomButton.isEnabled = false
        }
    }
    
    @IBAction func colorSlider(_ sender: UISlider) {
        //slider設定
        wavePic.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        //label隨數值變換
        redValue.text = String(format: "%.2f", redSlider.value)
        greenValue.text = String(format: "%.2f", greenSlider.value)
        blueValue.text = String(format: "%.2f", blueSlider.value)
        alphaValue.text = String(format: "%.1f", alphaSlider.value)
    }
    
    @IBAction func radomButton(_ sender: Any) {
        let red = Float.random(in: 0...1)
        let green = Float.random(in: 0...1)
        let blue = Float.random(in: 0...1)
        let alpha = Double.random(in: 0...1)
        
        wavePic.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
        
        redValue.text = String(format: "%.2f", red)
        greenValue.text = String(format: "%.2f", green)
        blueValue.text = String(format: "%.2f", blue)
        alphaValue.text = String(format: "%.1f", alpha)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        alphaSlider.value = Float(alpha)
    }
    
    @IBAction func gradienSliderAction(_ sender: UISlider) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [UIColor.yellow.cgColor,UIColor.systemTeal.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    gradientView.layer.addSublayer(gradientLayer)
    }
}

