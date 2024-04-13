import UIKit

class SecondCell: UICollectionViewCell {
    
    let courceButton: UIButton = {
        var button = UIButton(type: .custom)
        button.setImage(UIImage(named: "button"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setCourceButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCourceButton(){
        contentView.addSubview(courceButton)
        NSLayoutConstraint.activate([
            courceButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            courceButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            courceButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
}

