//
//  HeaderCollectionReusableView.swift
//  NsatavnicMVP+
//
//  Created by Лев Суханов on 05.03.2024.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    let label: UILabel = {
        let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 24)
         label.font = UIFont(name: "Gropled", size: 24)
         label.text = "Уведомления"
         return label
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        addLabel()
        
    }
    func addLabel(){
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 30)

        ])
    }
    
}
