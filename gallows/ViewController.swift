//  ViewController.swift
//  gallows
//  Created by Kiwi on 17.02.2021.

import UIKit

class ViewController: UIViewController {
    
    var image: UIImageView!
    var wordLabel: UILabel!
    var answerButton: UIButton!
    
    var words = [String]()
    var score = 0
    
    override func loadView() {
        super.loadView()
        
        image = UIImageView()
        wordLabel = UILabel()
        answerButton = UIButton()
        
        view.addSubview(image)
        view.addSubview(wordLabel)
        view.addSubview(answerButton)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        answerButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3, constant: -10),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            
            wordLabel.widthAnchor.constraint(greaterThanOrEqualTo: image.widthAnchor),
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wordLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 24),
            
            answerButton.widthAnchor.constraint(greaterThanOrEqualTo: image.widthAnchor),
            answerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerButton.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 24)
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.backgroundColor = UIColor.green
        wordLabel.backgroundColor = UIColor.red
        answerButton.backgroundColor = UIColor.blue
        
        answerButton.setTitle("Назовёте букву?", for: .normal)
        
        wordLabel.textAlignment = .center
        wordLabel.numberOfLines = 0
        wordLabel.font = UIFont.systemFont(ofSize: 24)
        wordLabel.text = "_____"
        
        loadWords()
    }

    func loadWords() {
        if let wordsFileURL = Bundle.main.url(
            forResource: "words", withExtension: "txt"
        ) {
            if let wordsContents = try? String(contentsOf: wordsFileURL) {
                let lines = wordsContents.components(separatedBy: "\n")
                words.append(contentsOf: lines)
            }
        }
        words.removeLast()
        print(words)
        newGame()
    }
    
    func newGame() {
        let word = words.shuffled()[0]
        wordLabel.text = underlineHint(numberOfLetters: word.count)
        print(word)

    }
    
    func underlineHint(numberOfLetters count: Int) -> String {
        var result: String = " "
        for _ in 1...count {
            result.append("_ ")
        }
        return result
    }
    
}

