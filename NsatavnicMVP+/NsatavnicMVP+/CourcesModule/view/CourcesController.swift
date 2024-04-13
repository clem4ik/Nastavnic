import UIKit

class CourcesController: UIViewController {

    var presenter: CourcesPressenterProtocol!
    
    var collection: UICollectionView!
    
    var upLAbel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.font = UIFont(name: "Gropled", size: 16)
        label.text = "Наставник"
        return label
    }()
    
    let textField: UITextField = {
       let field = UITextField()
        field.layer.cornerRadius = 18
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    let filterButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.3932150006, green: 0.09347750992, blue: 0.9099661708, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 24
        button.setTitle("Фильтр", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Кнопка меню"), for: .normal)
        return button
    }()
    
    var recognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        loadCollection()
        setCollection()
        setLabel()
        setTextField()
        setButton()
        recognizer.addTarget(self, action: #selector(tapOnMenueButton))
        button.addGestureRecognizer(recognizer)
        setMenueButton()
    }
    
    func setMenueButton(){
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 790),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 48),
            button.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setButton(){
        view.addSubview(filterButton)
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            filterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            filterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            filterButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setTextField(){
        let image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        image.frame = CGRect(x: 0, y: 0, width: 20, height: textField.frame.height)
        
        textField.rightView = image
        textField.rightViewMode = .always
        
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: upLAbel.bottomAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    func setLabel(){
        view.addSubview(upLAbel)
        upLAbel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upLAbel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            upLAbel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upLAbel.widthAnchor.constraint(equalToConstant: 85),
            upLAbel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func loadCollection(){
        collection = UICollectionView(frame: .zero, collectionViewLayout: createComposLayout())
        collection.register(FirstCourcesCell.self, forCellWithReuseIdentifier: "First")
        collection.register(SecondCourcesCell.self, forCellWithReuseIdentifier: "Second")
    }
    func setCollection(){
        view.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 174),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        collection.dataSource = self
    }
    

}
extension CourcesController: CourcesControllerProtocol{
    
}

extension CourcesController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.allSection.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.allSection[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch presenter.allSection[indexPath.section]{
        case .recomendation(let recomend):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "First", for: indexPath) as? FirstCourcesCell else{fatalError()}
            cell.configure(data: recomend[indexPath.row])
            return cell
            
        case .recomendationCources(let recomendBlock):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Second", for: indexPath) as? SecondCourcesCell else{fatalError()}
            cell.configure(data: recomendBlock[indexPath.row])
            return cell
            
        case .all(let all):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "First", for: indexPath) as? FirstCourcesCell else{fatalError()}
            cell.configure(data: all[indexPath.row])
            return cell
            
        case .allCources(let allBlok):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Second", for: indexPath) as? SecondCourcesCell else{fatalError()}
            cell.configure(data: allBlok[indexPath.row])
            return cell
        }
    }
}

extension CourcesController{
    func createComposLayout()->UICollectionViewCompositionalLayout{
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else{fatalError()}
            let section = presenter.allSection[sectionIndex]
            
            switch section{
            case .recomendation(_):
                return createStringsSection()
            case .recomendationCources(_):
                return createBlockSection()
            case .all(_):
                return createStringsSection()
            case .allCources(_):
                return createBlockSection()
            }
        }
        return layout
    }
}

extension CourcesController{
    
    func createLoyautSection(group: NSCollectionLayoutGroup, behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior, interGropuSpacing: CGFloat)-> NSCollectionLayoutSection{
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGropuSpacing
        return section
        
    }
    
    func createStringsSection()->NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .estimated(384), heightDimension: .estimated(21)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .estimated(1)), subitems: [item])
        
        let section = createLoyautSection(group: group, behavior: .continuous, interGropuSpacing: 5)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 5
        section.contentInsets = .init(top: 20, leading: 5, bottom: 0, trailing: 0)
        
        return section
    }
    func createBlockSection()->NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(390), heightDimension: .estimated(278)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .estimated(1)), subitems: [item])
        
        let section = createLoyautSection(group: group, behavior: .continuous, interGropuSpacing: 5)
        //section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 20, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
}
extension CourcesController{
    @objc func tapOnMenueButton(){
        presenter.tapOnMenue()
    }
}
