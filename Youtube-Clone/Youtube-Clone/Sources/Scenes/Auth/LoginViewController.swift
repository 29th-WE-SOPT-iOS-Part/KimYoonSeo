//
//  SignInViewController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/02.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: GoogleTextField!
    @IBOutlet weak var emailTextField: GoogleTextField!
    @IBOutlet weak var passwordTextField: GoogleTextField!
    
    @IBOutlet weak var nextButton: GoogleButton!{
        didSet{
            nextButton.isEnabled = false
            nextButton.setBackgroundColor(.systemGray3, for: .disabled)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTargets()
    }

    @IBAction func accountButtonDidTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: Const.Storyboard.auth, bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: Const.ViewController.signUp) as? SignUpViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
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
    
    private func setButtonState(){
        if !nameTextField.hasText || !emailTextField.hasText || !passwordTextField.hasText {
            nextButton.isEnabled = false
        }else {
            nextButton.isEnabled = true
        }
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
}

