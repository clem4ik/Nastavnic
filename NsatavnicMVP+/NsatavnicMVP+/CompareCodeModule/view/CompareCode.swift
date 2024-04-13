import UIKit

class CompareCode: UIViewController {

    var presenter: ComparePresenterProtocol!
    
    let mailTextField: UITextField = {
       let field = UITextField()
        field.layer.cornerRadius = 23
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    var button: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = UIColor.red
        button.setTitle("asd", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        setupTextField()
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        setButton()
        
    }
    
    func setupTextField(){
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
    
    func setButton(){
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 600),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
extension CompareCode: CompareControllerProtocol{
    func setMail(mail: String) {
        let mail = mail
    }
}
extension CompareCode: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mailTextField.resignFirstResponder()
        return true
    }
    
}
extension CompareCode{
    func createAlert()->UIAlertController{
        let allertAction = UIAlertAction(title: "OK", style: .cancel)
        
        let allert = UIAlertController(title: "Неверный код", message: "Попоробуйте ввести код снова", preferredStyle: .alert)
        allert.addAction(allertAction)
        
        return allert
    }
}
extension CompareCode{
    @objc func tapped(){
    
        let que = DispatchQueue(label: " ", attributes: .concurrent)
        let simaphore = DispatchSemaphore(value: 1)
        
        que.async {
            simaphore.wait()
            self.presenter.getCode(mail: self.presenter.mail, code: self.mailTextField.text!)
            simaphore.signal()
        }
        que.async { [self] in
            simaphore.wait()
            sleep(5)
            if self.presenter.data == "Invalid code!"{
                DispatchQueue.main.async {
                    present(self.createAlert(), animated: true)
                }
            }
            else{
                DispatchQueue.main.async {
                    self.presenter.tapOnCheckCode()
                }
            }
            simaphore.signal()
        }
        
    }
}

