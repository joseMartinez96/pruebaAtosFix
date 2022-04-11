//
//  formViewViewController.swift
//  pruebaAtos
//
//  Created by IOS_002 on 08/04/22.
//

import UIKit

public enum fieldsCustomForm{
    case email
    case password
    case name
    case phone
    case confirmPassword
    
    func setValueCustomForm() -> TypeFormEntity{
        switch self {
        case .email:
            return TypeFormEntity.init(tittle: "EMAIL", imgName: "mail",keyBoardTyepe: .emailAddress)
        case .password:
            return TypeFormEntity.init(tittle: "PASSWORD", imgName: "circle.slash",keyBoardTyepe: .default)
        case .name:
            return TypeFormEntity.init(tittle: "NAME", imgName: "person.fill",keyBoardTyepe: .default)
        case .phone:
            return TypeFormEntity.init(tittle: "PHONE", imgName: "phone.fill",keyBoardTyepe: .numberPad)
        case .confirmPassword:
            return TypeFormEntity.init(tittle: "CONFIRM PASSWORD", imgName: "circle.slash",keyBoardTyepe: .default)
        
        }
    }
}

struct TypeFormEntity{
    var tittle: String
    var imgName: String
    var keyBoardTyepe: UIKeyboardType
}

class formViewView: UIView {

    private let identifier = "formViewView"
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtInputText: UITextField!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var imgView: UIImageView!
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.commonInit()
            self.setUpView()
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.commonInit()
            self.setUpView()
        }
        
        
        private func commonInit(){
            let bundle = Bundle.init(for: formViewView.self)
            if let viewToAdd = bundle.loadNibNamed(identifier, owner: self, options: nil), let contentView = viewToAdd.first as? UIView{
                addSubview(contentView)
                contentView.frame = self.bounds
                contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            }
            
        }
    
    private func setUpView(){
        
        let uiColorGray = UIColor.convertToRGB("ADADAD").cgColor
                
                self.txtInputText.delegate = self
                self.mainView.roundCornersViewAll(radius: 10)
                self.mainView.layer.borderWidth = 1
        self.mainView.layer.borderColor = uiColorGray
                //        self.mainView.backgroundColor = .yellow
        self.layoutIfNeeded()
    }
    
    func setTypeForm(_ type: fieldsCustomForm){
        
        lblTitle.text = type.setValueCustomForm().tittle
        
        imgView.image = UIImage.init(systemName: type.setValueCustomForm().imgName)
    }

}


extension formViewView: UITextFieldDelegate{
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.txtInputText.resignFirstResponder()
        
        return true
    }
    
}
