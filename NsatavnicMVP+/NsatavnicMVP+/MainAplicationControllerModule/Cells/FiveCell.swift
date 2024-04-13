import UIKit

class FiveCell: UICollectionViewCell {
    let categoryiamgeView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setImageOnView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageOnView(){
        contentView.addSubview(categoryiamgeView)
        categoryiamgeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryiamgeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryiamgeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryiamgeView.widthAnchor.constraint(equalToConstant: 390),
            categoryiamgeView.heightAnchor.constraint(equalToConstant: 278)
        
        ])
    }
    func configure(data: DecodeCources){
        if let url = URL(string: data.avatar!) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
              guard let imageData = data else { return }

              DispatchQueue.main.async {
                  self.categoryiamgeView.image = UIImage(data: imageData)
              }
            }.resume()
        }
    }
}
