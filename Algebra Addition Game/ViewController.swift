//
//  ViewController.swift
//  Algebra Addition Game
//
//  Created by Rosario Tarabocchia on 9/24/15.
//  Copyright © 2015 RLDT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblTotalCorrect: UILabel!
    @IBOutlet weak var lblTotalIncorrect: UILabel!
    @IBOutlet weak var lblCorrectIncorrect: UILabel!
    
    @IBOutlet weak var btnAnswer0: UIButton!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    
    
    var firstNumber : Int = 0
    var unknownNumber : Int = 0
    var answer : Int = 0
    var buttonCorrect : Int = 0
    var buttonIncorrect1 : Int = 0
    var buttonIncorrect2 : Int = 0
    var buttonIncorrect3 : Int = 0
    
    var totalCorrect : Int = 0
    var totalIncorrect : Int = 0
    var correctIncorrect = ""
    
    var printQuestion : Int = 0
    
    var wrongAnswers : Int = 0
    var rightAnswers : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        randomizeThenumbers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnAnswer0ACTION(sender: UIButton) {
        if buttonCorrect == 0 {
            printCorrect()
        }
        
        else {
            
            printIncorrect()
        }
    }
    
    
    @IBAction func btnAnswer1ACTION(sender: UIButton) {
        
        if buttonCorrect == 1 {
            printCorrect()
        }
            
        else {
            
            printIncorrect()
        }
    }
    
    
    @IBAction func btnAnswer2ACTION(sender: UIButton) {
        
        if buttonCorrect == 2 {
            printCorrect()
        }
            
        else {
            
            printIncorrect()
        }
    }
    
    
    @IBAction func btnAnswer3ACTION(sender: UIButton) {
        
        if buttonCorrect == 3 {
            printCorrect()
        }
            
        else {
            
            printIncorrect()
        }
    }
    
    
    func randomizeThenumbers(){
        
        printQuestion = Int(arc4random_uniform(2))
        firstNumber = Int(arc4random_uniform(101))
        unknownNumber = Int(arc4random_uniform(101))
        
        answer = firstNumber + unknownNumber
        
        buttonCorrect = Int(arc4random_uniform(4))
        
        buttonIncorrect1 = Int(arc4random_uniform(101))
        buttonIncorrect2 = Int(arc4random_uniform(101))
        buttonIncorrect3 = Int(arc4random_uniform(101))
        
        randomNumberCheck()
        
        if printQuestion == 0 {
            
            printQuestion1()
        }
        
        else {
            
            printQuestion2()
        }
        
        printButtonLogic()
        

        
        
    }
    
    func printQuestion1(){
        lblQuestion.text = "\(firstNumber) + X = \(answer)"
        
    }
    
    func printQuestion2(){
        lblQuestion.text = "X + \(firstNumber) = \(answer)"
        
    }
    
    func printButtonLogic(){
        
        if buttonCorrect == 0 {
            btnAnswer0.setTitle("\(unknownNumber)", forState: UIControlState.Normal)
            btnAnswer1.setTitle("\(buttonIncorrect1)", forState: UIControlState.Normal)
            btnAnswer2.setTitle("\(buttonIncorrect2)", forState: UIControlState.Normal)
            btnAnswer3.setTitle("\(buttonIncorrect3)", forState: UIControlState.Normal)
            
        }
        
        if buttonCorrect == 1 {
            btnAnswer0.setTitle("\(buttonIncorrect1)", forState: UIControlState.Normal)
            btnAnswer1.setTitle("\(unknownNumber)", forState: UIControlState.Normal)
            btnAnswer2.setTitle("\(buttonIncorrect2)", forState: UIControlState.Normal)
            btnAnswer3.setTitle("\(buttonIncorrect3)", forState: UIControlState.Normal)
            
        }
        
        if buttonCorrect == 2 {
            btnAnswer0.setTitle("\(buttonIncorrect1)", forState: UIControlState.Normal)
            btnAnswer1.setTitle("\(buttonIncorrect2)", forState: UIControlState.Normal)
            btnAnswer2.setTitle("\(unknownNumber)", forState: UIControlState.Normal)
            btnAnswer3.setTitle("\(buttonIncorrect3)", forState: UIControlState.Normal)
            
        }
        
        if buttonCorrect == 3 {
            btnAnswer0.setTitle("\(buttonIncorrect1)", forState: UIControlState.Normal)
            btnAnswer1.setTitle("\(buttonIncorrect3)", forState: UIControlState.Normal)
            btnAnswer2.setTitle("\(buttonIncorrect2)", forState: UIControlState.Normal)
            btnAnswer3.setTitle("\(unknownNumber)", forState: UIControlState.Normal)
            
        }
        
        
        
    }
    
    
    func printCorrect(){
        rightAnswers = Int(arc4random_uniform(4))
        
        totalCorrect = totalCorrect + 1
        
        if rightAnswers == 0 {
        
        correctIncorrect = "CORRECTAMUNDO!"
            
        }
        
        if rightAnswers == 1 {
            
            correctIncorrect = "Wow are you smart!!!"
            
        }
        
        if rightAnswers == 2 {
            
            correctIncorrect = "Ding! Ding! Ding!"
            
        }
        
        if rightAnswers == 3 {
            
            correctIncorrect = "Einstein has nothing on you!"
            
        }
        
        
        printCorrectIncorrect()
        
        
    }
    
    func printIncorrect(){
        wrongAnswers = Int(arc4random_uniform(4))
        
        totalIncorrect = totalIncorrect + 1
        
        
        if wrongAnswers == 0 {
        
        correctIncorrect = "Man are you stupid!"
            
        }
        
        if wrongAnswers == 1 {
            
            correctIncorrect = "Maybe something easier.. what's 1 + 1?"
            
        }
        
        if wrongAnswers == 2 {
            
            correctIncorrect = "WRONG!!!"
            
        }
        
        if wrongAnswers == 3 {
            
            correctIncorrect = "Durrrrrrrr!"
            
        }
        
        printCorrectIncorrect()
        
        
      
        
        
    }
    
    
    func printCorrectIncorrect(){
        lblTotalCorrect.text = "Total Correct: \(totalCorrect)"
        lblTotalIncorrect.text = "Total Incorrect: \(totalIncorrect)"
        lblCorrectIncorrect.text = "\(correctIncorrect)"
        randomizeThenumbers()
        
    }
    
    
    
    @IBAction func btnReset(sender: UIButton) {
        reset()
    }
    
    func reset(){
        totalIncorrect = 0
        totalCorrect = 0
        correctIncorrect = ""
        printCorrectIncorrect()
        randomizeThenumbers()
    }
    
    
    func randomNumberCheck(){
        if unknownNumber == buttonIncorrect1 || unknownNumber == buttonIncorrect2 || unknownNumber == buttonIncorrect3 || buttonIncorrect1 == buttonIncorrect2 || buttonIncorrect1 == buttonIncorrect3 || buttonIncorrect2 == buttonIncorrect3 {
            
            buttonIncorrect1 = Int(arc4random_uniform(101))
            buttonIncorrect2 = Int(arc4random_uniform(101))
            buttonIncorrect3 = Int(arc4random_uniform(101))
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    


}

