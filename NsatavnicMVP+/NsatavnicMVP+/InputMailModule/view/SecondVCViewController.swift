import UIKit

class SecondVCViewController: UIViewController {

    var presenter: MailPresenterProtocol!
    
    let upLabel = UILabel()
    let mailLabel = UILabel()
    let mainLabel = UILabel()
    
    let contButton = UIButton(type: .system)
    let popButton = UIButton(type: .system)
    
    let popRecognizer = UITapGestureRecognizer()
    let continueRecognizer = UITapGestureRecognizer()
    
    let mailTextField: UITextField = {
       let field = UITextField()
        field.layer.cornerRadius = 23
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        createsLabels(label: upLabel, leading: 157, top: 55, width: 85, height: 10, text: presenter.mailDatas.upLabel, size: 16)
        createsLabels(label: mailLabel, leading: 164, top: 248, width: 72, height: 21, text: presenter.mailDatas.mailLabel, size: 24)
        createsLabels(label: mainLabel, leading: 11, top: 289, width: 375, height: 46, text: presenter.mailDatas.mainLabel, size: 16)
        
        createsButton(button: contButton, title: presenter.mailDatas.continumButtonLabel, recognizer: continueRecognizer, color: UIColor.black, top: 710, leading: 20, textColor: UIColor.white)
        createsButton(button: popButton, title: presenter.mailDatas.popButtonLabel, recognizer: popRecognizer, color: UIColor.systemBackground, top: 766, leading: 20, textColor: UIColor.black)
        
        popRecognizer.addTarget(self, action: #selector(popTapped))
        continueRecognizer.addTarget(self, action: #selector(continuTapped))
        
        setupTextField()
    }
    
    func createsLabels(label: UILabel, leading: CGFloat, top: CGFloat, width: CGFloat?, height: CGFloat?, text: String, size: CGFloat){
        label.text = text
        label.font = UIFont.systemFont(ofSize: size)
        label.font = UIFont(name: "Gropled", size: size)
        label.numberOfLines = 0
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading),
            label.widthAnchor.constraint(equalToConstant: width ?? 0),
            label.heightAnchor.constraint(equalToConstant: height ?? 0)
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
    func setupTextField(){
        mailTextField.placeholder = presenter.mailDatas.placeholderLabel
        mailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: mailTextField.frame.height))
        mailTextField.leftViewMode = .always
        view.addSubview(mailTextField)
        mailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 360),
            mailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mailTextField.heightAnchor.constraint(equalToConstant: 46)
        ])
        mailTextField.delegate = self
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil{
            view.endEditing(true)
        }
        super .touchesBegan(touches, with: event)
    }
    
}
extension SecondVCViewController: MailViewProtocol{
    
}
extension SecondVCViewController{
    @objc func popTapped(){
        presenter.tapOnPopButton()
        
    }
}
extension SecondVCViewController{
    @objc func continuTapped(){
        guard let mailText = mailTextField.text else{return}
        if mailText == ""{
            let alert = UIAlertController(title: "Почтовый адрес не найден", message: "Введите корректный адрес почты", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
            
        }
        else{
            presenter.mail = mailTextField.text
            presenter.getMail(mail: mailTextField.text!)
            presenter.tapOnContinumButton()
        }
    }
    
}
extension SecondVCViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mailTextField.resignFirstResponder()
        return true
    }
    
}
