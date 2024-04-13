import UIKit

class MainAplicationController: UIViewController {

    var presenter: AplicationPresenterProtocol!
    
    var collectionView: UICollectionView!
    
    var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Кнопка меню"), for: .normal)
        return button
    }()

    var recognizer = UITapGestureRecognizer()
    
    let upLabel: UILabel = {
       var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.font = UIFont(name: "Gropled", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Наставник"
        return label
    }()
    
    let texField: UITextField = {
       let field = UITextField()
        field.layer.cornerRadius = 16
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.placeholder = "Поиск по категориям"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: field.frame.height))
        field.leftViewMode = .always
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let courceButton: UIButton = {
        var button = UIButton(type: .custom)
        button.setImage(UIImage(named: "button"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let recomendationLAbel: UILabel = {
       var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.font = UIFont(name: "Gropled", size: 24)
        label.text = "Рекомендации"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        setUpLabel()
        
        presenter.setCourcesArr()
        settingsCollection()
        setupCollection()
        setButton()
        recognizer.addTarget(self, action: #selector(tapOnButton))
        button.addGestureRecognizer(recognizer)
        setCourceButton()
        setRecomendationLabel()
        setField()

    }
    
    func setRecomendationLabel(){
        collectionView.addSubview(recomendationLAbel)
        NSLayoutConstraint.activate([
            recomendationLAbel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 250),
            recomendationLAbel.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            recomendationLAbel.widthAnchor.constraint(equalToConstant: 186),
            recomendationLAbel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    func setCourceButton(){
        collectionView.addSubview(courceButton)
        NSLayoutConstraint.activate([
            courceButton.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 190),
            courceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            courceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            courceButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
    
    func setField(){
        collectionView.addSubview(texField)
        NSLayoutConstraint.activate([
            texField.topAnchor.constraint(equalTo: collectionView.topAnchor),
            texField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            texField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
            texField.heightAnchor.constraint(equalToConstant: 36)
        ])
        texField.delegate = self
    }
    
    func setUpLabel(){
        view.addSubview(upLabel)
        NSLayoutConstraint.activate([
            upLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            upLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 157),
            upLabel.widthAnchor.constraint(equalToConstant: 85),
            upLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func setButton(){
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 790),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 48),
            button.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func settingsCollection(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(OneCell.self, forCellWithReuseIdentifier: "First")
        collectionView.register(FiveCell.self, forCellWithReuseIdentifier: "Five")
    }
    func setupCollection(){
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        collectionView.dataSource = self
    }
    
    func createLayout()->UICollectionViewCompositionalLayout{
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else{fatalError()}
            let section = presenter.allCources[sectionIndex]
            
            switch section{
            case .storys(_):
                return createStorySection()
            case .firstSection(_):
                return createmainSection()
            }
        }
        return layout
    }
    
}
extension MainAplicationController: AplicationControllerProtocol{
    func setArr(arr: [AplicationSection]) {
        
    }
}
extension MainAplicationController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.allCources.count

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        presenter.allCources[section].items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch presenter.allCources[indexPath.section]{
        case .storys(let storys):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "First", for: indexPath) as? OneCell else{fatalError()}
            cell.configure(data: storys[indexPath.row])
            return cell
        case .firstSection(let all):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Five", for: indexPath) as? FiveCell else{fatalError()}
            cell.configure(data: all[indexPath.row])
            return cell

        }
    }
}

extension MainAplicationController{
    
    func createLoyautSection(group: NSCollectionLayoutGroup, behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior, interGropuSpacing: CGFloat)-> NSCollectionLayoutSection{
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGropuSpacing
        return section
        
    }
    
    func createStorySection() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(85), heightDimension: .absolute(107)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .estimated(1)), subitems: [item])
        
        let section = createLoyautSection(group: group, behavior: .continuous, interGropuSpacing: 5)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 8
        section.contentInsets = .init(top: 60, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    func createmainSection()->NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .estimated(390), heightDimension: .absolute(278)))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .estimated(1)), subitems: [item])
        
        let section = createLoyautSection(group: group, behavior: .continuous, interGropuSpacing: 5)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 165, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
}
extension MainAplicationController{
    @objc func tapOnButton(){
        presenter.tapOnButton()
    }
}
extension MainAplicationController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() 
        return true
    }
}
