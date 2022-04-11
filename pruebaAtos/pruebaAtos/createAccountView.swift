//
//  createAccountView.swift
//  pruebaAtos
//
//  Created by IOS_002 on 08/04/22.
//

import Foundation
import UIKit

class createAccountView: UIViewController{
    
    @IBOutlet weak var viewName: formViewView!
    @IBOutlet weak var viewEmail: formViewView!
    
    @IBOutlet weak var viewPhone: formViewView!
    
    @IBOutlet weak var viewPassword: formViewView!
    
    @IBOutlet weak var btnCreateAccount: buttonBlue!
    @IBOutlet weak var viewConfirmPassword: formViewView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewName.setTypeForm(.name)
        viewEmail.setTypeForm(.email)
        viewPhone.setTypeForm(.phone)
        viewPassword.setTypeForm(.password)
        viewConfirmPassword.setTypeForm(.confirmPassword)
        
        viewPassword.txtInputText.isSecureTextEntry = true
        viewConfirmPassword.txtInputText.isSecureTextEntry = true
        
        btnCreateAccount.setTitle("CREATE ACCOUNT", for: .normal)
    }
    
    
    
    @IBAction func btnGoToLogin(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    
    
}
