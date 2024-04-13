import UIKit

class ThreeCell: UICollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.font = UIFont(name: "Gropled", size: 24)
        label.textColor = #colorLiteral(red: 0.0901960656, green: 0.0901960656, blue: 0.0901960656, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabel(){
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
   
    
}
