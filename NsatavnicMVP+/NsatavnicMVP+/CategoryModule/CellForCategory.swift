import UIKit

class CellForCategory: UICollectionViewCell {
    var categoryLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.0901960656, green: 0.0901960656, blue: 0.0901960656, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupCell()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupCell(){
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 23
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
        addSubview(categoryLabel)
        
    }
    func setConstraints(){
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    func configure(datas: DecodeCategorys){
        categoryLabel.text = datas.name
    }
}
