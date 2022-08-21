//
//  TvShowsView.swift
//  Goo
//
//  Created by Mauricio Zarate Chula on 19/08/22.
//  
//

import Foundation
import UIKit

class TvShowsView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    // MARK: Properties
    var presenter: TvShowsPresenterProtocol?
    
    var datosView = [TvShow]()
    var swipeCellTool = false
    
    private let tableShows: UITableView = {
          let tableV = UITableView()
         return tableV
       }()
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        presenter?.viewDidLoad()
        tableShows.delegate = self
        tableShows.dataSource = self
        setUpView()
        tableShows.register(ShowsTableViewCell.self, forCellReuseIdentifier: ShowsTableViewCell.identifier)
        tableShows.layoutMargins = UIEdgeInsets.zero
        tableShows.separatorInset = UIEdgeInsets.zero
        super.viewDidLoad()
    }
    
    func setUpView(){
        view.addSubview(tableShows)
        tableShows.translatesAutoresizingMaskIntoConstraints = false
        
        tableShows.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        tableShows.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableShows.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableShows.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
       }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let user = datosView[indexPath.row]
        let favActTitle = swipeCellTool ? "Delete" : "Favorite"
        
        let actionFav = UITableViewRowAction(style: .normal, title: favActTitle) {  _, indexPath in
            self.swipeCellTool.toggle()
            self.tableShows.reloadRows(at: [indexPath], with: .automatic)
        }
        
        if !swipeCellTool {
            actionFav.backgroundColor = .systemGreen
        }else{
            actionFav.backgroundColor = .red
        }
     
        return [actionFav]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datosView.count - 230
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableShows.dequeueReusableCell(withIdentifier: ShowsTableViewCell.identifier, for: indexPath as IndexPath) as! ShowsTableViewCell
        cell.selectionStyle = .none
        cell.nameLabel.text =  datosView[indexPath.row].name
        cell.photoImg.downloaded(from: datosView[indexPath.row].image?.medium ?? "")
        cell.iconArrow.image = UIImage(systemName: "chevron.right")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(datosView[indexPath.row].isFav)
    }
    
}


extension TvShowsView: TvShowsViewProtocol {
    func presentToView(recev: [TvShow]) {
        datosView = recev
        DispatchQueue.main.async {
            self.tableShows.reloadData()
        }
        
    }
    
    // TODO: implement view output methods
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

