import UIKit

class OneCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
       var image = UIImageView()
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = 9
        return image
    }()
    
    let backView: UIView = {
       var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3932150006, green: 0.09347750992, blue: 0.9099661708, alpha: 1)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setBackView()
        setPicture()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPicture(){
        backView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 102)
        ])
    }
    
    func setBackView(){
        contentView.addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(data: DecodeCources){
        if let url = URL(string: data.avatar!) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
              guard let imageData = data else { return }

              DispatchQueue.main.async {
                  self.imageView.image = UIImage(data: imageData)
              }
            }.resume()
        }
    }
}
