import UIKit

class CellForSelect: UICollectionViewCell {
    var label: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.font = UIFont(name: "Gropled", size: 24)
        return label
    }()
    override init(frame: CGRect) {
        super .init(frame: frame)
        setCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(){
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    func configure(datas: DecodeCategorys){
        label.text = datas.name
    }
}

