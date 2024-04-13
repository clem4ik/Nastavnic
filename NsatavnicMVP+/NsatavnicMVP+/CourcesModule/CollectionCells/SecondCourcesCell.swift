import UIKit

class SecondCourcesCell: UICollectionViewCell {
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setImageCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageCell(){
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 390),
            imageView.heightAnchor.constraint(equalToConstant: 278)
        ])
    }
    func configure(data: CourcesModel){
        imageView.image = UIImage(named: data.blockRecomendation)
    }
}
