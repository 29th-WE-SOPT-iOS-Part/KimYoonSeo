//
//  SignUpViewController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/06.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: GoogleTextField!
    @IBOutlet weak var emailTextField: GoogleTextField!
    @IBOutlet weak var passwordTextField: GoogleTextField!
    
    @IBOutlet weak var nextButton: GoogleButton!{
        didSet{
            nextButton.isEnabled = false
            nextButton.setBackgroundColor(.systemGray3, for: .disabled)
            
        }
    }

    @IBOutlet weak var maskingButton: UIButton!{
        didSet{
            maskingButton.isSelected = false
            maskingButton.setTitleColor(.systemGray3, for: .selected)
            maskingButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected )
            maskingButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
            maskingButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -6)
            maskingButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 6)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTargets()
    }
    
    @IBAction func maskingButtonDidTapped(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
        maskingButton.isSelected.toggle()
    }
    
    @IBAction func nextButtonDidTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: Const.Storyboard.auth, bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: Const.ViewController.welcome) as? WelcomeViewController else {return}
        if let text = nameTextField.text {
            vc.name = text
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private func setTargets() {
        [nameTextField, emailTextField, passwordTextField].forEach{
            $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        }
    }
    
    @objc
    func textFieldDidChange(_ textField : UITextField){
        setButtonState()
    }
    
    private func setButtonState(){
        if !nameTextField.hasText || !emailTextField.hasText || !passwordTextField.hasText {
            nextButton.isEnabled = false
        }else {
            nextButton.isEnabled = true
        }
    }

}
