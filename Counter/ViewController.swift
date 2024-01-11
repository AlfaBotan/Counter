//
//  ViewController.swift
//  Counter
//
//  Created by Илья Волощик on 8.01.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var counter = 0
    
    private var currentTime: String {
        Date().description(with: .current)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика: \(counter)"
        historyTextView.isScrollEnabled = true
    }
    
    

    @IBAction private func plusButtonTapped(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        historyTextView.text += "\n[\(currentTime)]: значение изменено на +1"
        let bottom = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    @IBAction private func minusButtonTapped(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значение счётчика: \(counter)"
            historyTextView.text += "\n[\(currentTime)]: значение изменено на -1"
        } else {
            historyTextView.text += "\n[\(currentTime)]: попытка уменьшить значение счётчика ниже 0"
        }
        let bottom = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    @IBAction private func refreshButtonTapped(_ sender: Any) {
        counter = 0
        counterLabel.text = "Значение счётчика: \(counter)"
        historyTextView.text += "\n[\(currentTime)]: значение сброшено"
        let bottom = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
}


