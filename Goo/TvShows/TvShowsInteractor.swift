//
//  TvShowsInteractor.swift
//  Goo
//
//  Created by Mauricio Zarate Chula on 19/08/22.
//  
//

import Foundation

class TvShowsInteractor: TvShowsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: TvShowsInteractorOutputProtocol?
    var localDatamanager: TvShowsLocalDataManagerInputProtocol?
    var remoteDatamanager: TvShowsRemoteDataManagerInputProtocol?
    
    var datos = [TvShow]()
    
    func interactorGetData() {
        //decirle a la capa de conec externaldatamanager
        remoteDatamanager?.externalGetData()
    }

}

extension TvShowsInteractor: TvShowsRemoteDataManagerOutputProtocol {
    func remoteCallBackData(with category: [TvShow]) {
        //interactor pasa data a presenter
        presenter?.interToPresenterData(receData: category)
    }
}
