//
//  KeyboardViewController.swift
//  Yipppee
//
//  Created by Sagar Sandy on 18/07/19.
//  Copyright © 2019 Sagar Sandy. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    @objc func diceRolled() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        let randomNumber = Int.random(in: 1...6)
        proxy.insertText("\(randomNumber)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let diceButton = UIButton(type: .system)
        diceButton.setBackgroundImage(UIImage(named:"dice"), for: .normal)
        diceButton.frame = CGRect(x: 150, y: 40, width: 100, height: 120)
        diceButton.addTarget(self, action: #selector(KeyboardViewController.diceRolled), for: .touchUpInside)
        view.addSubview(diceButton)
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
