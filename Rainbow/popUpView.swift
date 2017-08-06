//
//  popUpView.swift
//  Rainbow
//
//  Created by Vince Lee on 2017/8/6.
//  Copyright © 2017年 Vince Lee. All rights reserved.
//

import UIKit


class popUpView: ViewController {

    @IBOutlet weak var popUpScore: UILabel!
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var closePopUpResetGame: UIButton!
    @IBAction func closePopUpResetGame(_ sender: UIButton) {
        self.removeAnimate()
        ViewController.score = 0
        ViewController.rainbowNumber = 0
        
        
    }
    

    
    
    override func viewDidLoad() {
        
        showAnimate()
        popUpScore.text = "你的分數：\(ViewController.score)"
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.7)
        popUpView.layer.cornerRadius = 20
        closePopUpResetGame.layer.cornerRadius = 10
        closePopUpResetGame.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
    }
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 0.0
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)}, completion:{(finished : Bool) in
                if  (finished){
                    self.view.removeFromSuperview()
                    
                    
                }
        }
        )}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
