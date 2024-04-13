import UIKit

class FourCell: UICollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.font = UIFont(name: "Gropled", size: 12)
        label.textColor = #colorLiteral(red: 0.0901960656, green: 0.0901960656, blue: 0.0901960656, alpha: 1)
        return label
    }()
    let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 19
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setView(){
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    func setLabel(){
        mainView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ])
    }
   
    
}
