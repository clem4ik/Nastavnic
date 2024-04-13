import UIKit

class CategoryController: UIViewController {

    var presenter: CategoryPresenterProtocol!
    
    var collectionView: UICollectionView!
    
    var myButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 23
        button.backgroundColor = UIColor.black
        button.setTitle("Всё выбрал(а). Дальше", for: .normal)
        return button
    }()
    
    var recognizer = UITapGestureRecognizer()
    
    let upLabel = UILabel()
    
    let boldLabel = UILabel()
    
    let mainLabel = UILabel()
    
    let getCat = GetCategorys.sgared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setId()
        //createLabels(label: <#T##UILabel#>, text: <#T##String#>, top: <#T##CGFloat#>, size: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        recognizer.addTarget(self, action: #selector(tapped))
        addCollection()
        setView()
        setupButton()
        myButton.addGestureRecognizer(recognizer)
        view.backgroundColor = UIColor.systemBackground
        
    }
    
    func setupButton(){
        collectionView.addSubview(myButton)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 466),
            myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            myButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            myButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
    
    func addCollection(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(CellForCategory.self, forCellWithReuseIdentifier: "First")

    }
    func createLayout()->UICollectionViewFlowLayout{
        let loyaut = UICollectionViewFlowLayout()
        loyaut.itemSize = CGSize(width: 80, height: 46)
        return loyaut
    }
    func setView(){
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 190),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func createLabels(label: UILabel, text: String, top: CGFloat, size: CGFloat, width: CGFloat, height: CGFloat){
        label.font = UIFont.systemFont(ofSize: size)
        label.font = UIFont(name: "Gropled", size: size)
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: width),
            label.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
extension CategoryController: CategoryControllerProtocol{
    func setId(id: Int) {
        let id = id
    }
}
extension CategoryController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return getCat.allArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "First", for: indexPath) as? CellForCategory else{fatalError()}
        cell.configure(datas: getCat.allArray[indexPath.row])
        return cell
    }
    
}
extension CategoryController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if getCat.allArray[indexPath.item].select_av == 1{
            collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.systemBackground
            getCat.allArray[indexPath.item].select_av = 0
        }
        else if getCat.allArray[indexPath.item].select_av == 0{
           collectionView.cellForItem(at: indexPath)?.backgroundColor = #colorLiteral(red: 0.3932150006, green: 0.09347750992, blue: 0.9099661708, alpha: 1)
            getCat.allArray[indexPath.item].select_av = 1
        }
        
    }
}
extension CategoryController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let categoryFont = UIFont(name: "Gropled", size: 16)
        let categoryAttribute = [NSAttributedString.Key.font: categoryFont as Any]
        let categoryWidth = getCat.allArray[indexPath.item].name.size(withAttributes: categoryAttribute).width + 10
        
        return CGSize(width: categoryWidth, height: collectionView.frame.height / 14)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

    return UIEdgeInsets(top: 10, left: 12, bottom: 0, right: 0)
    }
    
}
extension CategoryController{
    @objc func tapped(){
        var selectArr = presenter.setSelectedArr(allArr: getCat.allArray)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        presenter.selectArr = selectArr
        
        if selectArr.count != 0{
            presenter.tapOnButton()
        }
        else{
            var alert = UIAlertController(title: "Невнрное действие", message: "Выберите хотя бы одну категорию, которую хотели бы изучить.", preferredStyle: .alert)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
    }
}
