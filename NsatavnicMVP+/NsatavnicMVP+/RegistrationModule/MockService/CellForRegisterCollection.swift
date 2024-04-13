import UIKit

class CellForRegisterCollection: UICollectionViewCell {
    let imageView = UIImageView()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.font = UIFont(name: "inter", size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupImages()
        setupLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImages(){
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    func setupLabel(){
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
    }
    
    func configure(datas: RegisterDatas){
        label.text = datas.label
        imageView.image = UIImage(named: datas.image)
    }
}
