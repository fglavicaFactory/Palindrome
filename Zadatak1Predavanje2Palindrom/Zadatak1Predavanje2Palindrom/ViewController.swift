//
//  ViewController.swift
//  Zadatak1Predavanje2Palindrom
//
//  Created by Filip Glavica on 06/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Palindrome"
        setupButton()
        setupTextField()
        setupDivider()
    }
    
    let palindromeTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Write out a palindrome"
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
    }()

    var dividerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let checkButton: UIButton = {
        let button = UIButton (type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Check", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.addTarget(self, action: #selector(buttonBeingPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    
    func setupButton(){
        view.addSubview(checkButton)
        checkButton.backgroundColor = UIColor.init(displayP3Red: 0.15, green: 0.4, blue: 0.51, alpha: 1.0)
        checkButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 242).isActive = true
        //checkButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 380).isActive = true
        checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55).isActive = true
        checkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupTextField(){
        view.addSubview(palindromeTextField)
        palindromeTextField.textColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        palindromeTextField.font = UIFont.systemFont(ofSize: 15)
        palindromeTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 155).isActive = true
        palindromeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        palindromeTextField.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: -8).isActive = true
        palindromeTextField.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
    
    func setupDivider(){
        view.addSubview(dividerView)
        dividerView.backgroundColor = .black
        dividerView.topAnchor.constraint(equalTo: palindromeTextField.bottomAnchor, constant: 10.5).isActive = true
        dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    
    @objc func buttonBeingPressed(sender: UIButton) {
        var palindrome: String = palindromeTextField.text!
        palindrome = palindrome.lowercased()
        let numberOfCharacters: Int = palindrome.count / 2
        var counter = 0
        
        let myCharacterSet = CharacterSet( charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        if palindrome.rangeOfCharacter(from: myCharacterSet.inverted) != nil {
            alertNotAWord()
        } else {
            
            for _ in 1 ... numberOfCharacters{
                if palindrome.prefix(1)==palindrome.suffix(1) {
                    counter += 1
                    let palindromeWoFirstLetter = String(palindrome.dropFirst())
                    let palindromeWoFirstAndLastLetter = String(palindromeWoFirstLetter.dropLast())
                    palindrome = palindromeWoFirstAndLastLetter
                }
            }
            if counter==numberOfCharacters {
                alertForaPalindrome()
            } else {
                alertNotAPalindrome()
            }

        }
    }
    
    
    func alertForaPalindrome(){
        let alert = UIAlertController(title: "Correct", message: "The word you entered is a palindrome! Do you know any more palindroms?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Write another palindrome", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }


    func alertNotAPalindrome(){
        let alert = UIAlertController(title: "Incorrect", message: "Word you entered is not a palindrome, clumsy you", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
}
    
    func alertNotAWord () {
        let alert = UIAlertController(title: "Not valid", message: "This is not a word, try entering a word which is a palindrome", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }








}
