//
//  ViewController.swift
//  Rainbow
//
//  Created by Vince Lee on 2017/8/6.
//  Copyright © 2017年 Vince Lee. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    let rainbowColor = [ UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, #colorLiteral(red: 0.3713564873, green: 0.1111276522, blue: 0.582187891, alpha: 1), #colorLiteral(red: 0.5803921569, green: 0, blue: 0.8274509804, alpha: 1)]
    let randomDistribution = GKRandomDistribution(lowestValue: 0, highestValue: 6)
    
    static var rainbowNumber = 0
    
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var rememberThisColor: UILabel!
    @IBOutlet weak var resetGame: UIButton!
    @IBAction func resetGame(_ sender: UIButton) {
        ViewController.score = 0
        showScore.text = "你的分數：\(ViewController.score)"
        ViewController.rainbowNumber = 0
        let number = randomDistribution.nextInt()
        view.backgroundColor = rainbowColor[number]
        
        nextColor.isHidden = false
        startGame.isHidden = true
        colorAdjustView.isHidden = true
        rememberThisColor.isHidden = true
}
  
    @IBOutlet weak var colorAdjustView: UIView!
    @IBOutlet weak var redSlide: UISlider!
    
    @IBOutlet weak var greenSlide: UISlider!
    @IBOutlet weak var blueSlide: UISlider!
    @IBAction func colorAdjust(_ sender: UISlider) {
        view.backgroundColor = UIColor(red: CGFloat(redSlide.value) , green: CGFloat(greenSlide.value), blue: CGFloat(blueSlide.value), alpha: 1)
        
    }
    
    @IBOutlet weak var startGame: UIButton!
    @IBAction func startGame(_ sender: Any) {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nextColor.isHidden = false
        startGame.isHidden = true
        colorAdjustView.isHidden = false
        rememberThisColor.isHidden = true
    }
    
    var colorAnswer:UIColor?
    static var score = 0
    @IBOutlet weak var nextColor: UIButton!
    @IBAction func nextColor(_ sender: Any) {
        
        colorAnswer = view.backgroundColor
        if ViewController.rainbowNumber > 0, colorAnswer == rainbowColor[(ViewController.rainbowNumber - 1) % 7] {
            ViewController.score += 1
        }
        if ViewController.rainbowNumber > 3 {
            instructionLabel.isHidden = true
        }
        view.backgroundColor = rainbowColor[ViewController.rainbowNumber % 7]
        ViewController.rainbowNumber += 1
        nextColor.isHidden = true
        startGame.isHidden = false
        colorAdjustView.isHidden = true
        rememberThisColor.isHidden = false
        resetGame.isHidden = false
        showScore.isHidden = false
        print(ViewController.score)
        showScore.text = "你的分數：\(ViewController.score)"
        if ViewController.rainbowNumber > 1 , ViewController.rainbowNumber % 7 == 1 {
            let number = randomDistribution.nextInt()
            view.backgroundColor = rainbowColor[number]
            
            nextColor.isHidden = false
            startGame.isHidden = true
            colorAdjustView.isHidden = true
            rememberThisColor.isHidden = true
            resetGame.isHidden = true
            showScore.isHidden = true
            showPopUp()
        }
    }
    @IBOutlet weak var showScore: UILabel!
    
    
    func showPopUp() {
        let popUpVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpView") as! popUpView
        self.addChildViewController(popUpVc)
        popUpVc.view.frame = self.view.frame
        self.view.addSubview(popUpVc.view)
        popUpVc.didMove(toParentViewController: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let number = randomDistribution.nextInt()
        view.backgroundColor = rainbowColor[number]
        startGame.isHidden = true
        colorAdjustView.isHidden = true
        rememberThisColor.isHidden = true
        nextColor.layer.cornerRadius = 10
        nextColor.layer.borderWidth = 1
        startGame.layer.cornerRadius = 10
        startGame.layer.borderWidth = 1
        showScore.layer.cornerRadius = 10
        showScore.layer.borderWidth = 1
        colorAdjustView.layer.cornerRadius = 20
        resetGame.layer.cornerRadius = 10
        resetGame.layer.borderWidth = 1
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

