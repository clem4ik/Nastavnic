import UIKit

class LoadController: UIViewController {

    var presenter: LoadPresenterProtocol!
    
    let myImage: UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(named: "Экран загрузки")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageView()

    }
    func setImageView(){
        view.addSubview(myImage)
        NSLayoutConstraint.activate([
            myImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myImage.widthAnchor.constraint(equalToConstant: 393),
            myImage.heightAnchor.constraint(equalToConstant: 852)
        ])
    }
    
}
extension LoadController: LoadControllerProtocol{
    
}
