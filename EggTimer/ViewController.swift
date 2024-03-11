//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var segundosTotais = 0
    var segundosPassados = 0
    
    var timer = Timer()
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var textTitle: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        segundosPassados = 0
        progressBar.progress = 0.0
        
        let hardness = sender.currentTitle!
        segundosTotais = eggTimes[hardness]!
        
        textTitle.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if(segundosPassados<segundosTotais){
            segundosPassados += 1
            let result: Float = Float(segundosPassados)/Float(segundosTotais)
            progressBar.progress = result
            
            
        } else {
            timer.invalidate()
            textTitle.text = "DONE!"
        }
    }
    

}
