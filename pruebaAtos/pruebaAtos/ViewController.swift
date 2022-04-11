//
//  ViewController.swift
//  pruebaAtos
//
//  Created by IOS_002 on 08/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUserName: formViewView!
    @IBOutlet weak var txtPassWord: formViewView!
    @IBOutlet weak var btnAccountView: UIButton!
    @IBOutlet weak var btnLogin: buttonBlue!
    
    var fetchLogin = LoginEntity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnAccountView.setTitle("create a new account", for: .normal)
        btnLogin.setTitle("LOGIN", for: .normal)
        
        
        
        fetchLogin.delegate = self
        txtUserName.setTypeForm(.email)
        txtPassWord.setTypeForm(.password)
    }
    
    
    @IBAction func btnActionLogin(_ sender: Any) {
        
        fetchLogin.fetchData(data: LoginRequest.init(userName: txtUserName.txtInputText.text!, password: txtPassWord.txtInputText.text!))
        
    }
    
    @IBAction func btnActionControllView(_ sender: Any) {
        
        performSegue(withIdentifier: "goTocreateAccountView", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goTocreateAccountView"{
            guard let vc = segue.destination as? createAccountView else { return}
            
        }
    }
}

extension ViewController: LoginProtocol{
    func isValidLogin(isValid: Bool) {
        
        if isValid{
            let view = ProductViewController(nibName: ProductViewController.identifier, bundle: .main)
            
            view.modalPresentationStyle = .overCurrentContext
            
            self.present(view, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "Alert", message: "EMAIL OR PASSWORD IS WRONG", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
}
