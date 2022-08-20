//
//  ShowsTableViewCell.swift
//  Goo
//
//  Created by Mauricio Zarate Chula on 19/08/22.
//

import UIKit

class ShowsTableViewCell: UITableViewCell {
    
    static let identifier = "ShowsTableViewCell"
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
              super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpConstraints()
       }

       required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
      }
    
    let photoImg:UIImageView = {
    let img = UIImageView()
        img.contentMode = .scaleAspectFit
    img.translatesAutoresizingMaskIntoConstraints = false
    img.layer.cornerRadius = 10
    img.clipsToBounds = true
    return img
    }()
    
    let nameLabel:UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textColor = UIColor(named: "titleColor")
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
    
    var iconArrow:UIImageView = {
    let img = UIImageView()
        img.contentMode = .scaleAspectFit
    img.translatesAutoresizingMaskIntoConstraints = false
    img.layer.cornerRadius = 10
    img.clipsToBounds = true
    return img
    }()
    
    func setUpConstraints() {
            contentView.addSubview(photoImg)
            contentView.addSubview(nameLabel)
            contentView.addSubview(iconArrow)
        
            photoImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7).isActive = true
            photoImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
            photoImg.widthAnchor.constraint(equalToConstant: 80).isActive = true
            photoImg.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            nameLabel.leadingAnchor.constraint(equalTo: photoImg.trailingAnchor, constant: 16).isActive = true
            nameLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
            nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
            //iconArrow.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
            iconArrow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            iconArrow.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8).isActive = true
            iconArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
            iconArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            
        }
    
}
