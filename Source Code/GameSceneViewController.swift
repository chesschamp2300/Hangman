//
//  GameSceneViewController.swift
//  Hangman
//
//  Created by Maggie Feng on 3/14/20.
//  Copyright © 2020 Maggie Feng. All rights reserved.
//

import UIKit
import CoreGraphics
import Foundation

var score = 0
var wordToGuess: String = ""
var wrongGuesses = 0
var timesLabelPlaced = 0
var indexForWords: Array<Int> = []
var xPositions: Array<CGFloat> = [(UIScreen.main.bounds.width / 2)-150]
var yPosition: CGFloat = (UIScreen.main.bounds.height / 2) + 100
var gameBeaten = false
var words: Array<String> = []





class GameSceneViewController: UIViewController {
    
    var charsOfWord: Array<String> = []

    @IBOutlet weak var userScoreLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func pressLetters(_ sender: UIButton) {
        let letter: String = sender.titleLabel!.text!

        if charsOfWord.contains(letter){
            
            for i in 0..<charsOfWord.count{
                if(letter == charsOfWord[i]){
                    let letterLabel = UILabel(frame: CGRect(x: xPositions[i], y: yPosition-30, width: 20, height: 20))
                    letterLabel.text = letter
                    letterLabel.font = UIFont(name: "Marker Felt", size: 20)
                    letterLabel.textAlignment = NSTextAlignment.center
                    self.view.addSubview(letterLabel)
                    timesLabelPlaced += 1
                    
                }
            }
            userScoreLabel.text = String(score)
            if(timesLabelPlaced == charsOfWord.count){
                score += 8
                if(indexForWords.isEmpty){
                    gameBeaten = true
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondViewController = storyboard.instantiateViewController(withIdentifier: "GameOver") as UIViewController
                    secondViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                    present(secondViewController, animated: true, completion: nil)
                }else{
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondViewController = storyboard.instantiateViewController(withIdentifier: "winVC") as UIViewController
                    secondViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                    present(secondViewController, animated: true, completion: nil)
                }
                
                
            }
        }else{
            wrongGuesses += 1
            if(wrongGuesses == 1){
                image.image = UIImage(named: "head")
            }else if(wrongGuesses == 2){
                image.image = UIImage(named: "headBody")
            }else if(wrongGuesses == 3){
                image.image = UIImage(named: "onearm")
            }else if(wrongGuesses == 4){
                image.image = UIImage(named: "twoarms")
            }else if(wrongGuesses == 5){
                image.image = UIImage(named: "oneleg")
            }else if(wrongGuesses == 6){
                image.image = UIImage(named: "everything")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let secondViewController = storyboard.instantiateViewController(withIdentifier: "GameOver") as UIViewController
                secondViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                present(secondViewController, animated: true, completion: nil)
                
            }
            
        }
        
        sender.isEnabled = false
        sender.alpha = 0.5
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userScoreLabel.font = UIFont(name: "Marker Felt", size: 25)
        userScoreLabel.text = String(score)
        image.image = UIImage(named: "noose")
        
        let length = wordToGuess.count
        for _ in 0..<length{
            charsOfWord.append(String(wordToGuess.prefix(1)))
            wordToGuess = String(wordToGuess.dropFirst(1))
        }
       
        wrongGuesses = 0
        timesLabelPlaced = 0
    }

}

class DrawOnView:UIView{
   
      override func draw(_ rect: CGRect) {

        
        if(indexForWords.isEmpty == false){
            
            let randIndex = indexForWords.randomElement()!
            wordToGuess = words[randIndex]
            let i = indexForWords.firstIndex(of: randIndex)
            indexForWords.remove(at: i!)
            
            
            var xCoor: CGFloat = xPositions.first!
                    
            let context = UIGraphicsGetCurrentContext()
            context?.setLineWidth(3.0)
            context?.setStrokeColor(UIColor.black.cgColor)
            for _ in 0..<wordToGuess.count{
                context?.move(to: CGPoint(x: xCoor, y: yPosition))
                context?.addLine(to: CGPoint(x: xCoor+20, y: yPosition))
                context?.strokePath()
                xCoor += 30
                xPositions.append(xCoor)
            }
        }
        
        
        
    }
}


