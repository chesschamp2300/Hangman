//
//  ViewController.swift
//  Hangman
//
//  Created by Maggie Feng on 3/12/20.
//  Copyright © 2020 Maggie Feng. All rights reserved.
//

import UIKit
import AVFoundation

var music: AVAudioPlayer?


class ViewController: UIViewController {

    @IBAction func pressPlay(_ sender: UIButton) {
        performSegue(withIdentifier: "pressPlay", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        playMusic()
        words = getWords()
        score = 0
        gameBeaten = false
        for i in 0..<words.count{
            if(words[i] != ""){
                indexForWords.append(i)
            }
            
        }
        
    }
    
    func getWords() -> [String]{
        let path = Bundle.main.path(forResource: "wordList", ofType: ".txt")
        let text = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        return text.components(separatedBy: CharacterSet.newlines)
    }
    
    func playMusic(){
        let path = Bundle.main.path(forResource: "beats", ofType: ".mp3")!
        let url = URL(fileURLWithPath: path)
        music = try? AVAudioPlayer(contentsOf: url)
        do{
            if(music?.isPlaying == false){
                music?.numberOfLoops = -1
                music?.play()
            }
        }
    }
    

}

