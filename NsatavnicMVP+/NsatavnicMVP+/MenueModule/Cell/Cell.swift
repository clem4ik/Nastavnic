import UIKit

class FirstCell: UICollectionViewCell {
    
    let firstLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.font = UIFont(name: "inter", size: 14)
        label.textColor = UIColor.black
        return label
    }()
    let secondLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor

        return view
    }()
    let myImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setViews()
        addText()
        addSecondText()
        setupImage()
        
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews(){
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainView.widthAnchor.constraint(equalToConstant: 347),
            mainView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func addText(){
        mainView.addSubview(firstLabel)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            firstLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 30),
            firstLabel.widthAnchor.constraint(equalToConstant: 90),
            firstLabel.heightAnchor.constraint(equalToConstant: 14)

        ])
    }
    func addSecondText(){
        mainView.addSubview(secondLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            secondLabel.leadingAnchor.constraint(equalTo: firstLabel.trailingAnchor, constant: 3),
            secondLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -5)
        ])
    }
    
    
    func setupImage(){
        contentView.addSubview(myImage)
        myImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myImage.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            myImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            myImage.widthAnchor.constraint(equalToConstant: 16),
            myImage.heightAnchor.constraint(equalToConstant: 16)
        
        ])
    }
    func configure(data: MenueModel){
        firstLabel.text = data.title
        secondLabel.text = data.secondTitle
        myImage.image = UIImage(systemName: data.image)
    }
}

