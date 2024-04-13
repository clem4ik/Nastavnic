import UIKit

class SelectCategoryController: UIViewController {

    var presenter: SelectPresenter!
    
    var selectArr = [DecodeCategorys]()
    
    var collectionView: UICollectionView!
    
    let selectLabel = UILabel()
    
    let continuButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Подтвердить выбор", for: .normal)
        button.backgroundColor = UIColor.black
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 23
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let backButtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Изменить выбор", for: .normal)
        button.backgroundColor = UIColor.systemBackground
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 23
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let continueAction = UITapGestureRecognizer()
    let backAction = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setId()
        
        view.backgroundColor = UIColor.systemBackground
        presenter.setArr()
        addCollectionView()
        setCollection()
        
        createLabels(label: selectLabel, text: "Выбранные вами категории:", top: 98, size: 24, width: 391, height: 41)
        
        continueAction.addTarget(self, action: #selector(continuTapped))
        backAction.addTarget(self, action: #selector(backTapped))
        
        constForButton(button: continuButton, top: 710, recognizer: continueAction)
        constForButton(button: backButtn, top: 766, recognizer: backAction)
        
    }
    func addCollectionView(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(CellForSelect.self, forCellWithReuseIdentifier: "First")
    }
    func createLayout()->UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 391, height: 31)
        return layout
    }
    func setCollection(){
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 148),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        collectionView.dataSource = self
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
    
    func constForButton(button: UIButton, top: CGFloat, recognizer: UIGestureRecognizer){
        view.addSubview(button)
        button.addGestureRecognizer(recognizer)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 46)
        ])
    }

}
extension SelectCategoryController: SelectCategoryProtocol{
    func setSelectArr(arr: [DecodeCategorys]) {
        selectArr = arr
    }
    func setId(id: Int) {
        
    }
}
extension SelectCategoryController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "First", for: indexPath) as? CellForSelect else {fatalError()}
        cell.configure(datas: selectArr[indexPath.row])
        return cell
    }
}
extension SelectCategoryController{
    @objc func continuTapped(){
        
        var arrId = presenter.addSelectId()
        presenter.addPost(userId: presenter.id, categorysId: arrId)
        
        let semaphore = DispatchSemaphore(value: 1)
        let que = DispatchQueue(label: "Three", attributes: .concurrent)
        
        que.async {
            semaphore.wait()
            DispatchQueue.main.async {
                self.presenter.addPost(userId: self.presenter.id, categorysId: arrId)
            }
            semaphore.signal()
        }
        que.async {
            semaphore.wait()
            sleep(4)
            DispatchQueue.main.async {
                self.presenter.tapOncontinuButton()
            }
            semaphore.signal()
        }
    }
    @objc func backTapped(){
        presenter.tapOnBackButton()
    }
}

