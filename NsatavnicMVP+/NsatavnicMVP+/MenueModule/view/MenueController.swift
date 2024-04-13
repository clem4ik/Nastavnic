import UIKit

class MenueController: UIViewController {

    var preseter: MenuePresenterProtocol!
    
    var collectionView: UICollectionView!
    
    let respond = UITapGestureRecognizer()
    let runOnHomePage = UITapGestureRecognizer()
    let runOnCourcesPage = UITapGestureRecognizer()
    let popControllerrecognizer = UITapGestureRecognizer()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Бар"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        addSettingCollection()
        setupCollection()
        
        runOnHomePage.addTarget(self, action: #selector(tapped))
        popControllerrecognizer.addTarget(self, action: #selector(tapToBack))
        runOnCourcesPage.addTarget(self, action: #selector(tapToCources))
        
        createLabelForView(view: createViewsButton(color: #colorLiteral(red: 0.3932150006, green: 0.09347750992, blue: 0.9099661708, alpha: 1), constantTop: 206, constantLeading: 1, corner: 30, widthConst: 190, heightConst: 190, respond: runOnHomePage), text: "Главная", size: 35, secondLabel: nil)
        createLabelForView(view: createViewsButton(color: #colorLiteral(red: 0.9257218838, green: 0.5549508929, blue: 0, alpha: 1), constantTop: 412, constantLeading: 1, corner: 30, widthConst: 190, heightConst: 190, respond: nil), text: "Эксперты", size: 35, secondLabel: nil)
        createLabelForView(view: createViewsButton(color: #colorLiteral(red: 0, green: 0.8025448918, blue: 0.8924085498, alpha: 1), constantTop: 206, constantLeading: 201, corner: 30, widthConst: 190, heightConst: 190, respond: runOnCourcesPage), text: "Курсы", size: 35, secondLabel: nil)
        createLabelForView(view: createViewsButton(color: #colorLiteral(red: 0.9551643729, green: 0, blue: 0, alpha: 1), constantTop: 412, constantLeading: 201, corner: 30, widthConst: 190, heightConst: 190, respond: nil), text: "Мое", size: 35, secondLabel: nil)
        
        createLabelForView(view: createViewsButton(color: #colorLiteral(red: 0.3932150006, green: 0.09347750992, blue: 0.9099661708, alpha: 1), constantTop: 618, constantLeading: 1, corner: 30, widthConst: 387, heightConst: 108, respond: nil), text: "Наставник GPT", size: 24, secondLabel: UILabel())
        
        setbackButton(recognizer: popControllerrecognizer)
        
    }
    
    func addSettingCollection(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(FirstCell.self, forCellWithReuseIdentifier: "First")
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        collectionView.layer.cornerRadius = 30
    }
    func createLayout()->UICollectionViewFlowLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 347, height: 19)
        layout.scrollDirection = .horizontal
        layout.headerReferenceSize = CGSize(width: 1, height: 1)
        return layout
        
    }
    func setupCollection(){
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: 387),
            collectionView.heightAnchor.constraint(equalToConstant: 190)
        ])
        collectionView.dataSource = self
    }
    
    func createViewsButton(color: UIColor, constantTop: CGFloat, constantLeading: CGFloat , corner: CGFloat, widthConst: CGFloat, heightConst: CGFloat, respond: UITapGestureRecognizer?)->UIView{
        let myView = UIView()
        myView.backgroundColor = color
        myView.layer.cornerRadius = corner
        if respond != nil{
            myView.addGestureRecognizer(respond!)
        }
        view.addSubview(myView)
        myView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constantTop),
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constantLeading),
            myView.widthAnchor.constraint(equalToConstant: widthConst),
            myView.heightAnchor.constraint(equalToConstant: heightConst)
        
        ])
        return myView
    }
    
    func createLabelForView(view: UIView, text: String, size: CGFloat, secondLabel: UILabel?){
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size)
        label.font = UIFont(name: "Helvetica Neue Bold", size: size)
        label.textColor = UIColor.white
        label.text = text
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        if secondLabel == nil{
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            
        }
        else{
            let secondLabel = UILabel()
            secondLabel.font = UIFont.systemFont(ofSize: 16)
            secondLabel.numberOfLines = 2
            secondLabel.text = "Главный чат этого года, он умеет вообще всё, всё что вам нужно и не нужно"
            secondLabel.textColor = UIColor.white
            view.addSubview(secondLabel)
            secondLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                secondLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
                secondLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                secondLabel.widthAnchor.constraint(equalToConstant: 347),
                secondLabel.heightAnchor.constraint(equalToConstant: 50)
            
            ])
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                label.widthAnchor.constraint(equalToConstant: 185),
                label.heightAnchor.constraint(equalToConstant: 24)
            ])
        }
        
    }
    func setbackButton(recognizer: UIGestureRecognizer){
        backButton.addGestureRecognizer(recognizer)
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 790),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 48),
            backButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
}
extension MenueController: MenueControllerProtocol{
    
}
extension MenueController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        preseter.mockData.addArr().count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "First", for: indexPath) as? FirstCell else{fatalError()}
        cell.configure(data: preseter.mockData.addArr()[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as? HeaderCollectionReusableView else{fatalError()}
        
        return header
    }
    
}
extension MenueController{
    @objc func tapped(){
        preseter.tapOnButton()
    }
}
extension MenueController{
    @objc func tapToBack(){
        preseter.tapOnButton()
    }
}
extension MenueController{
    @objc func tapToCources(){
        preseter.tapOnCourcesButton()
    }
}
