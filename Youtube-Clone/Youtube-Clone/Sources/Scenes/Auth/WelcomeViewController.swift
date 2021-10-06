//
//  WelcomeViewController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/06.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel! {
        didSet{
            welcomeLabel?.text = "\(name)님\n환영합니다"
        }
    }
    
    public lazy var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


}
