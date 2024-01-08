//
//  ViewController.swift
//  Counter
//
//  Created by Илья Волощик on 8.01.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLable: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    var counter = 0
    
    var currentTime: String {
        Date().description(with: .current)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLable.text = "Значение счётчика: \(counter)"
        textView.isScrollEnabled = true
    }
    
    

    @IBAction func pressPlusButton(_ sender: Any) {
        counter += 1
        counterLable.text = "Значение счётчика: \(counter)"
        textView.text += "\n[\(currentTime)]: значение изменено на +1"
        let bottom = NSMakeRange(textView.text.count - 1, 1)
        textView.scrollRangeToVisible(bottom)
    }
    
    @IBAction func pressMinusButton(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLable.text = "Значение счётчика: \(counter)"
            textView.text += "\n[\(currentTime)]: значение изменено на -1"
        } else {
            textView.text += "\n[\(currentTime)]: попытка уменьшить значение счётчика ниже 0"
        }
        let bottom = NSMakeRange(textView.text.count - 1, 1)
        textView.scrollRangeToVisible(bottom)
    }
    
    @IBAction func refreshButon(_ sender: Any) {
        counter = 0
        counterLable.text = "Значение счётчика: \(counter)"
        textView.text += "\n[\(currentTime)]: значение сброшено"
        let bottom = NSMakeRange(textView.text.count - 1, 1)
        textView.scrollRangeToVisible(bottom)
    }
}


