//
//  ViewController.swift
//  Milestone28-30
//
//  Created by Jason Mitchell on 5/11/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cards: [UIButton]!
    
    let emojiChoices = ["😁", "😍", "😂", "😭", "😱", "🍻"]
    var emojiPairs: [String] = []
    
    var firstCard: (tag: Int, emoji: String)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiChoices.forEach { emojiPairs.append($0) }
        emojiChoices.forEach { emojiPairs.append($0) }
        emojiPairs.shuffle()
        
        for (index, card) in cards.enumerated() {
            card.setTitle(emojiPairs[index], for: .normal)
            card.titleLabel?.layer.opacity = 0
            card.layer.cornerRadius = 10
        }
    }
    
    
    @IBAction func flipCard(_ sender: UIButton) {
        guard let currentCardEmoji = sender.titleLabel?.text else { return }
        
//        cards[sender.tag].titleLabel?.isHidden = true
        cards[sender.tag].isEnabled = false
        
        if firstCard == nil {
            firstCard = (tag: sender.tag, emoji: currentCardEmoji)
        } else {
            if firstCard?.emoji == currentCardEmoji {
                guard let firstCard = cards?[(firstCard?.tag)!] else { return }
                let currentCard = cards[sender.tag]
                
                firstCard.backgroundColor = .green
//                firstCard.isEnabled = false
                currentCard.backgroundColor = .green
//                currentCard.isEnabled = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    firstCard.layer.opacity = 0
                    currentCard.layer.opacity = 0
                }
                
                self.firstCard = nil
            } else {
                guard let firstCard = cards?[(firstCard?.tag)!] else { return }
                let currentCard = cards[sender.tag]
                
                firstCard.backgroundColor = .red
                currentCard.backgroundColor = .red
                firstCard.isEnabled = true
                currentCard.isEnabled = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    firstCard.titleLabel?.layer.opacity = 0
                    firstCard.backgroundColor = .white
                    currentCard.titleLabel?.layer.opacity = 0
                    currentCard.backgroundColor = .white
                }
                
                self.firstCard = nil
            }
        }
    }
}

