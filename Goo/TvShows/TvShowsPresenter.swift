//
//  TvShowsPresenter.swift
//  Goo
//
//  Created by Mauricio Zarate Chula on 19/08/22.
//  
//

import Foundation

class TvShowsPresenter  {
    
    // MARK: Properties
    weak var view: TvShowsViewProtocol?
    var interactor: TvShowsInteractorInputProtocol?
    var wireFrame: TvShowsWireFrameProtocol?
    
}

extension TvShowsPresenter: TvShowsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.interactorGetData()
    }
}

extension TvShowsPresenter: TvShowsInteractorOutputProtocol {
    func interToPresenterData(receData: [TvShow]) {
        view?.presentToView(recev: receData)
    }

}
