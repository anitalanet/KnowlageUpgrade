//
//  KeyboardViewController.swift
//  CustomKeybord
//
//  Created by Lcom32 on 10/25/17.
//  Copyright © 2017 Lcom32. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "keybordView", bundle: nil)
        let object = nib.instantiate(withOwner: self, options: nil)
        view = object[0] as! UIView
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
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
    
    
    @IBAction func keyActionEvents(_ sender: Any) {
        
        let button = sender as? UIButton
        let string = button?.titleLabel?.text as! String
        self.textDocumentProxy.insertText(string)
    }
    
    
    @IBAction func capsLockEvent(_ sender: Any) {
    }
    
    @IBAction func changeKeyboardEvent(_ sender: Any) {
        
        //self.handleInputModeList(from: view, with: UITouch)
        
    }
    
    @IBAction func SpaceEvent(_ sender: Any) {
        self.textDocumentProxy.insertText(" ")

    }
    @IBAction func returnEvent(_ sender: Any) {
        self.textDocumentProxy.insertText("\n")

    }
    
    @IBAction func numberKeyPadEvent(_ sender: Any) {
    }
    @IBAction func backEvent(_ sender: Any) {
        self.textDocumentProxy.deleteBackward();
    }
    
    
}
