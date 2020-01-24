//
//  ViewController.swift
//  TipCalculator
//
//  Created by Camilo Cabana on 24/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    
    var keyboardHeight = CGFloat()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 40)
        label.text = "Tip Calculator"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let amountTextField: TipTextField = {
        let textField = TipTextField()
        textField.becomeFirstResponder()
        textField.keyboardType = .decimalPad
        textField.placeholder = "Bill Amount"
        return textField
    }()
    
    let percentTextField: TipTextField = {
        let textField = TipTextField()
        textField.placeholder = "Tip Percent"
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    let divideByTextField: TipTextField = {
        let textField = TipTextField()
        textField.placeholder = "Divide By"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let clearButton: TipButton = {
        let button = TipButton()
        button.setTitle("Clear", for: .normal)
        return button
    }()
    
    let calculateButton: TipButton = {
        let button = TipButton()
        button.setTitle("Calculate", for: .normal)
        return button
    }()
    
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let tipInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
        name: UIResponder.keyboardDidShowNotification, object: nil)
        calculateButton.addTarget(self, action: #selector(goToResult), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearTextFields), for: .touchUpInside)
    }
    
    func setLayout() {
        view.backgroundColor = .cyan
        view.addSubview(tipInfoStackView)
        view.addSubview(titleView)
        titleView.addSubview(titleLabel)
        tipInfoStackView.addArrangedSubview(amountTextField)
        tipInfoStackView.addArrangedSubview(percentTextField)
        tipInfoStackView.addArrangedSubview(divideByTextField)
        tipInfoStackView.addArrangedSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(clearButton)
        buttonsStackView.addArrangedSubview(calculateButton)
        tipInfoStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tipInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tipInfoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        titleView.bottomAnchor.constraint(equalTo: tipInfoStackView.topAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
    }
    
    @objc func goToResult() {
        if amountTextField.text != "" && percentTextField.text != "" && divideByTextField.text != "" {
            present(ResultViewController(), animated: true)
        } else {
            let alert = Alert()
            alert.alert(title: "System", message: "Please fill all the text fields", vc: self)
        }
    }
    
    @objc func clearTextFields() {
        amountTextField.text = ""
        percentTextField.text = ""
        divideByTextField.text = ""
    }
    
    @objc func keyboardWillShow(notification: Notification) {
          let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
          let keyboardRectangle = keyboardFrame.cgRectValue
          keyboardHeight = keyboardRectangle.height
        print(keyboardHeight)
    }
}

