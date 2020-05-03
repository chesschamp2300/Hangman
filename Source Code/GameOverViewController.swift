//
//  GameOverViewController.swift
//  Hangman
//
//  Created by Maggie Feng on 3/15/20.
//  Copyright © 2020 Maggie Feng. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var gameOvertext: UILabel!
    @IBOutlet weak var userScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if(indexForWords.isEmpty && gameBeaten){
            gameOvertext.font = UIFont(name: "Marker Felt", size: 47)
            gameOvertext.text = "You Beat the Game"
        }else{
            gameOvertext.font = UIFont(name: "Marker Felt", size: 74)
            gameOvertext.text = "Game Over"
        }
        userScoreLabel.font = UIFont(name: "Marker Felt", size: 40)
        userScoreLabel.text = String(score)
        xPositions.removeAll()
        xPositions.append((UIScreen.main.bounds.width / 2)-150)
        indexForWords.removeAll()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
