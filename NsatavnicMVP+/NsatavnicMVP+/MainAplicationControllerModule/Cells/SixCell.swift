import UIKit

class SixCell: UICollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.font = UIFont(name: "Gropled", size: 24)
        label.textColor = #colorLiteral(red: 0.8901961446, green: 0.8901961446, blue: 0.8901961446, alpha: 1)
        label.numberOfLines = 2
        return label
    }()
    let mainView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        return view
    }()
    let image: UIImageView = {
       let image = UIImage(named: "point")
        let imageView = UIImageView()
        imageView.image = image
        return imageView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setMainView()
        setupLabel()
        setImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMainView(){
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.widthAnchor.constraint(equalToConstant: 350),
            mainView.heightAnchor.constraint(equalToConstant: 92)
        ])
    }
    func setupLabel(){
        mainView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 335),
            label.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    func setImage(){
        mainView.addSubview(image)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30),
            image.leadingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 5)
        ])
    }
    
    
}
