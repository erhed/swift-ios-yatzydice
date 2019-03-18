//
//  ViewController.swift
//  Yatzy
//
//  Created by Erik on 2019-02-05.
//  Copyright © 2019 Erik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var rolling : Bool = false
    var animateTimer = Timer()
    
    var diceValue : Int = 0
    
    var imgNameArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    var diceObjectArray = Array<Dice>()
    
    var imgViewArray = Array<UIImageView>()
    
    @IBOutlet weak var imgDice1: UIImageView!
    @IBOutlet weak var imgDice2: UIImageView!
    @IBOutlet weak var imgDice3: UIImageView!
    @IBOutlet weak var imgDice4: UIImageView!
    @IBOutlet weak var imgDice5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgViewArray = [imgDice1, imgDice2, imgDice3, imgDice4, imgDice5]
        
        diceObjectArray.append(Dice(img: "dice0", locked: false))
        diceObjectArray.append(Dice(img: "dice0", locked: false))
        diceObjectArray.append(Dice(img: "dice0", locked: false))
        diceObjectArray.append(Dice(img: "dice0", locked: false))
        diceObjectArray.append(Dice(img: "dice0", locked: false))
        
        reset()
        addTapDetector()
    }
    
    // Roll dice-button

    @IBAction func buttonRollDice(_ sender: Any) {
        if !rolling {
            Timer.scheduledTimer(timeInterval: TimeInterval(2), target: self, selector: #selector(ViewController.rollDice), userInfo: nil, repeats: false)
            animateTimer = Timer.scheduledTimer(timeInterval: TimeInterval(0.2), target: self, selector: #selector(ViewController.animateDice), userInfo: nil, repeats: true)
            rolling = true
        }
    }
    
    // Reset-button
    
    @IBAction func buttonReset(_ sender: Any) {
        reset()
    }
    
    // FUNCTIONS
    
    // Result
    
    @objc func rollDice() {
        animateTimer.invalidate()
        rolling = false
        
        for dice in diceObjectArray {
            if !dice.locked {
                diceValue = Int(arc4random_uniform(6))
                dice.img = imgNameArray[diceValue]
            }
        }
        
        showDice()
    }
    
    // Animate
    
    @objc func animateDice() {
        for dice in diceObjectArray {
            if !dice.locked {
                diceValue = Int(arc4random_uniform(6))
                dice.img = imgNameArray[diceValue]
            }
        }
        showDice()
    }
    
    // Reset
    
    func reset() {
        if !rolling {
            for img in imgViewArray {
                img.image = UIImage(named: "dice0")
                img.layer.borderWidth = 0
            }
            
            for dice in diceObjectArray {
                dice.locked = false
                dice.img = "dice0"
            }
        }
    }
    
    // Render
    
    func showDice() {
        imgDice1.image = UIImage(named: diceObjectArray[0].img)
        imgDice2.image = UIImage(named: diceObjectArray[1].img)
        imgDice3.image = UIImage(named: diceObjectArray[2].img)
        imgDice4.image = UIImage(named: diceObjectArray[3].img)
        imgDice5.image = UIImage(named: diceObjectArray[4].img)
    }
    
    func addTapDetector() {
        let singleTap1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap1))
        singleTap1.numberOfTapsRequired = 1
        imgDice1.isUserInteractionEnabled = true
        imgDice1.addGestureRecognizer(singleTap1)
        
        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap2))
        singleTap2.numberOfTapsRequired = 1
        imgDice2.isUserInteractionEnabled = true
        imgDice2.addGestureRecognizer(singleTap2)
        
        let singleTap3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap3))
        singleTap3.numberOfTapsRequired = 1
        imgDice3.isUserInteractionEnabled = true
        imgDice3.addGestureRecognizer(singleTap3)
        
        let singleTap4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap4))
        singleTap4.numberOfTapsRequired = 1
        imgDice4.isUserInteractionEnabled = true
        imgDice4.addGestureRecognizer(singleTap4)
        
        let singleTap5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap5))
        singleTap5.numberOfTapsRequired = 1
        imgDice5.isUserInteractionEnabled = true
        imgDice5.addGestureRecognizer(singleTap5)
    }
    
    @objc func tap1() {
        diceObjectArray[0].locked = !diceObjectArray[0].locked
        if diceObjectArray[0].locked {
            imgDice1.layer.borderColor = UIColor(red:255/255, green:0/255, blue:0/255, alpha: 1).cgColor
            imgDice1.layer.borderWidth = 1
        } else {
            imgDice1.layer.borderWidth = 0
        }
    }
    
    @objc func tap2() {
        diceObjectArray[1].locked = !diceObjectArray[1].locked
        if diceObjectArray[1].locked {
            imgDice2.layer.borderColor = UIColor(red:255/255, green:0/255, blue:0/255, alpha: 1).cgColor
            imgDice2.layer.borderWidth = 1
        } else {
            imgDice2.layer.borderWidth = 0
        }
    }
    
    @objc func tap3() {
        diceObjectArray[2].locked = !diceObjectArray[2].locked
        if diceObjectArray[2].locked {
            imgDice3.layer.borderColor = UIColor(red:255/255, green:0/255, blue:0/255, alpha: 1).cgColor
            imgDice3.layer.borderWidth = 1
        } else {
            imgDice3.layer.borderWidth = 0
        }
    }
    
    @objc func tap4() {
        diceObjectArray[3].locked = !diceObjectArray[3].locked
        if diceObjectArray[3].locked {
            imgDice4.layer.borderColor = UIColor(red:255/255, green:0/255, blue:0/255, alpha: 1).cgColor
            imgDice4.layer.borderWidth = 1
        } else {
            imgDice4.layer.borderWidth = 0
        }
    }
    
    @objc func tap5() {
        diceObjectArray[4].locked = !diceObjectArray[4].locked
        if diceObjectArray[4].locked {
            imgDice5.layer.borderColor = UIColor(red:255/255, green:0/255, blue:0/255, alpha: 1).cgColor
            imgDice5.layer.borderWidth = 1
        } else {
            imgDice5.layer.borderWidth = 0
        }
    }
    
    class Dice {
        var img : String
        var locked : Bool
        
        init(img: String, locked: Bool)
        {
            self.img = img
            self.locked = locked
        }
    }
}

