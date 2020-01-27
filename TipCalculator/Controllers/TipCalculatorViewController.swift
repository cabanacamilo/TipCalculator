//
//  ViewController.swift
//  TipCalculator
//
//  Created by Camilo Cabana on 24/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    
    var heightTipVIew = NSLayoutConstraint()
    
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
    
    let buttonsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tipView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
        name: UIResponder.keyboardDidShowNotification, object: nil)
        calculateButton.addTarget(self, action: #selector(goToResult), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearTextFields), for: .touchUpInside)
    }
    
    func setLayout() {
        view.backgroundColor = .cyan
        view.addSubview(tipView)
        tipView.addSubview(tipInfoStackView)
        tipView.addSubview(titleView)
        titleView.addSubview(titleLabel)
        tipView.addSubview(buttonsView)
        buttonsView.addSubview(buttonsStackView)
        tipInfoStackView.addArrangedSubview(amountTextField)
        tipInfoStackView.addArrangedSubview(percentTextField)
        tipInfoStackView.addArrangedSubview(divideByTextField)
        buttonsStackView.addArrangedSubview(clearButton)
        buttonsStackView.addArrangedSubview(calculateButton)
        tipView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tipView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tipView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        heightTipVIew = tipView.heightAnchor.constraint(equalToConstant: view.frame.height)
        tipInfoStackView.centerYAnchor.constraint(equalTo: tipView.centerYAnchor).isActive = true
        tipInfoStackView.leadingAnchor.constraint(equalTo: tipView.leadingAnchor, constant: 10).isActive = true
        tipInfoStackView.trailingAnchor.constraint(equalTo: tipView.trailingAnchor, constant: -10).isActive = true
        titleView.bottomAnchor.constraint(equalTo: tipInfoStackView.topAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: tipView.topAnchor).isActive = true
        titleView.leadingAnchor.constraint(equalTo: tipView.leadingAnchor).isActive = true
        titleView.trailingAnchor.constraint(equalTo: tipView.trailingAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        buttonsView.bottomAnchor.constraint(equalTo: tipView.bottomAnchor).isActive = true
        buttonsView.trailingAnchor.constraint(equalTo: tipView.trailingAnchor).isActive = true
        buttonsView.leadingAnchor.constraint(equalTo: tipView.leadingAnchor).isActive = true
        buttonsView.topAnchor.constraint(equalTo: tipInfoStackView.bottomAnchor).isActive = true
        buttonsStackView.leadingAnchor.constraint(equalTo: tipView.leadingAnchor, constant: 10).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: tipView.trailingAnchor, constant: -10).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: buttonsView.centerYAnchor).isActive = true
        NSLayoutConstraint.activate([heightTipVIew])
    }
}

extension TipCalculatorViewController {
    
    @objc func goToResult() {
        if amountTextField.text != "" && percentTextField.text != "" && divideByTextField.text != "" {
            let resultViewController = ResultViewController()
            var tipInfo = Tip(amount: 0.0, percent: 0.0, divideBy: 0.0)
            tipInfo.amount = Float(amountTextField.text ?? "") ?? 0.0
            tipInfo.percent = Float(percentTextField.text ?? "") ?? 0.0
            tipInfo.divideBy = Float(divideByTextField.text ?? "") ?? 0.0
            resultViewController.tipInfo = tipInfo
            present(resultViewController, animated: true)
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
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        NSLayoutConstraint.deactivate([heightTipVIew])
        heightTipVIew = tipView.heightAnchor.constraint(equalToConstant: view.frame.height)
        NSLayoutConstraint.activate([heightTipVIew])
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        NSLayoutConstraint.deactivate([heightTipVIew])
        heightTipVIew = tipView.heightAnchor.constraint(equalToConstant: view.frame.height - keyboardRectangle.height)
        NSLayoutConstraint.activate([heightTipVIew])
    }
}

