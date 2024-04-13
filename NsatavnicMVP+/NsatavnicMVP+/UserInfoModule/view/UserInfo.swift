import UIKit
import CoreData

class UserInfo: UIViewController {
    
    var presenter: UserInfoPresenterProtocol!
    
    let upLabel = UILabel()
    let nameOrNicknameLabel = UILabel()
    let optionLabel = UILabel()
    let henderLabel = UILabel()
    let mainLabel = UILabel()
    let notificationLabel = UILabel()
    let secondMainLabel = UILabel()
    
    let oneField = UITextField()
    let twoField = UITextField()
    
    var id: String!
    
    var menuItems: [UIAction] {
        return [
            UIAction(title: "Мужчина", image: nil, handler: { [self] (_) in
                twoField.placeholder = "asd"
            }),
            UIAction(title: "Женщина", image: nil, handler: { (_) in
            }),
            UIAction(title: "Другое", image: nil, handler: { (_) in
            })
        ]
    }
    var demoMenu: UIMenu {
        return UIMenu(title: "Выберите пол", image: nil, identifier: nil, options: [], children: menuItems)
    }
    
    let button: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Vector 9"), for: .normal)
        return button
    }()
    
    let recognizer = UITapGestureRecognizer()
    
    let notificationsButton = UIButton(type: .system)
    let notificationRecognizer = UITapGestureRecognizer()
    let continuButton = UIButton(type: .system)
    let continuRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setId()
        view.backgroundColor = UIColor.systemBackground
        createsLabels(label: upLabel, top: 55, width: 85, height: 10, text: presenter.userInfoDatas.upLabel, size: 16)
        createsLabels(label: nameOrNicknameLabel, top: 78, width: 249, height: 41, text: presenter.userInfoDatas.preMainLabel, size: 24)
        createsLabels(label: optionLabel, top: 119, width: 375, height: 46, text: presenter.userInfoDatas.mainLabel, size: 16)
        createsLabels(label: henderLabel, top: 335, width: 56, height: 21, text: presenter.userInfoDatas.henderLabel, size: 24)
        createsLabels(label: mainLabel, top: 366, width: 375, height: 20, text: presenter.userInfoDatas.secondMainLabel, size: 14)
        createsLabels(label: notificationLabel, top: 560, width: 277, height: 21, text: presenter.userInfoDatas.notificationLabel, size: 24)
        createsLabels(label: secondMainLabel, top: 601, width: 375, height: 46, text: presenter.userInfoDatas.threeMainLabel, size: 16)
        
        creatsTextsFields(textField: oneField, placeholder: "Имя", top: 190)
        creatsTextsFields(textField: twoField, placeholder: "", top: 415)
        
        addConstraintsForButton()
        recognizer.addTarget(self, action: #selector(tapped))
        button.addGestureRecognizer(recognizer)
        
        createsButton(button: notificationsButton, title: "Нажмите чтобы разрешить", recognizer: nil, color: UIColor.systemBackground, top: 672, leading: 20, textColor: UIColor.black)
        createsButton(button: continuButton, title: "Продолжить", recognizer: continuRecognizer, color: UIColor.black, top: 766, leading: 20, textColor: UIColor.white)
        continuRecognizer.addTarget(self, action: #selector(continum))
        continuButton.addGestureRecognizer(continuRecognizer)
        
    }
    
    func createsLabels(label: UILabel, top: CGFloat, width: CGFloat?, height: CGFloat?, text: String, size: CGFloat){
        label.text = text
        label.font = UIFont.systemFont(ofSize: size)
        label.font = UIFont(name: "Gropled", size: size)
        label.numberOfLines = 0
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: width ?? 0),
            label.heightAnchor.constraint(equalToConstant: height ?? 0)
        ])
    }
    func creatsTextsFields(textField: UITextField, placeholder: String, top: CGFloat){
        textField.layer.cornerRadius = 23
        textField.placeholder = placeholder
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.leftViewMode = .always
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 46)
        ])
        textField.delegate = self
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil{
            view.endEditing(true)
        }
        super .touchesBegan(touches, with: event)
    }
    
    func addConstraintsForButton(){
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: twoField.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: twoField.trailingAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: 14),
            button.heightAnchor.constraint(equalToConstant: 8)
        
        ])
    }
    func createsButton(button: UIButton, title: String, recognizer: UITapGestureRecognizer?, color: UIColor, top: CGFloat, leading: CGFloat, textColor: UIColor){
        button.backgroundColor = color
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 23
        button.setTitleColor(textColor, for: .normal)
        if recognizer != nil{
            button.addGestureRecognizer(recognizer!)
        }
        else{
            button.addGestureRecognizer(UIGestureRecognizer())
        }
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
}
extension UserInfo: UserInfoControllerProtocol{
    func setId(id: Int) {
        let id = id
    }
    
}
extension UserInfo: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        oneField.resignFirstResponder()
        twoField.resignFirstResponder()
        return true
    }
}
extension UserInfo{
    @objc func tapped(){
        button.menu = demoMenu
        button.showsMenuAsPrimaryAction = true
    }
}
extension UserInfo{
    @objc func continum(){
        if oneField.text == "" || twoField.text == ""{
            let allert = UIAlertController(title: "Не все поля заполнены", message: "Заполните все необходимые поля", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            allert.addAction(action)
            present(allert, animated: true)
        }
        else{
            presenter.getID(name: self.oneField.text!, gender: self.twoField.text!, id2: self.presenter.id)
            presenter.tapOncontinuButton()
        }
            
    }
}
