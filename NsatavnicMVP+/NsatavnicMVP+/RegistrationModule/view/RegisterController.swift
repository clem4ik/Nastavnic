import UIKit

class RegisterController: UIViewController {

    var presenter: RegisterPresenterProtocol!
    
    var collectionView: UICollectionView!
    
    let upLabel = UILabel()
    let mainLabel = UILabel()
    let registerLabel = UILabel()
    
    let getCat = GetCategorys.sgared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        getCat.getAllCategory()
        registerCollection()
        setupCollection()
        createsLabels(label: upLabel, leading: 157, top: 55, width: 85, height: 10, text: presenter.labels.upLabel, size: 16)
        createsLabels(label: mainLabel, leading: 20, top: 256, width: 366, height: 120, text: presenter.labels.mainLabel, size: 36)
        createsLabels(label: registerLabel, leading: 20, top: 481, width: 157, height: 21, text: presenter.labels.aurorizationLabel, size: 24)
    }
    
    func registerCollection(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(CellForRegisterCollection.self, forCellWithReuseIdentifier: "First")
        
    }
    
    func createLayout()->UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 77, height: 77)
        return layout
    }
    
    func setupCollection(){
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 547),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.widthAnchor.constraint(equalToConstant: 355),
            collectionView.heightAnchor.constraint(equalToConstant: 106)
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func createsLabels(label: UILabel, leading: CGFloat, top: CGFloat, width: CGFloat?, height: CGFloat?, text: String, size: CGFloat){
        label.text = text
        label.font = UIFont.systemFont(ofSize: size)
        label.font = UIFont(name: "Gropled", size: size)
        label.numberOfLines = 0
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading),
            label.widthAnchor.constraint(equalToConstant: width ?? 0),
            label.heightAnchor.constraint(equalToConstant: height ?? 0)
        ])
        
    }
    
}
extension RegisterController: MainViewProtocol{
    
}
extension RegisterController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "First", for: indexPath) as? CellForRegisterCollection else{fatalError()}
        cell.configure(datas: presenter.images[indexPath.row])
        return cell
    }
}
extension RegisterController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.tapOnTheCell()
    }
}

