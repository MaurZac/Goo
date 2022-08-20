//
//  TvShowsProtocols.swift
//  Goo
//
//  Created by Mauricio Zarate Chula on 19/08/22.
//  
//

import Foundation
import UIKit

protocol TvShowsViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: TvShowsPresenterProtocol? { get set }
    func presentToView(recev: [TvShow])
}

protocol TvShowsWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createTvShowsModule() -> UIViewController
}

protocol TvShowsPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: TvShowsViewProtocol? { get set }
    var interactor: TvShowsInteractorInputProtocol? { get set }
    var wireFrame: TvShowsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol TvShowsInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func interToPresenterData(receData: [TvShow])
        
    
}

protocol TvShowsInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: TvShowsInteractorOutputProtocol? { get set }
    var localDatamanager: TvShowsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: TvShowsRemoteDataManagerInputProtocol? { get set }
    
    //Func que permite al interactor gestionar data con la exe desde el presenter
    func interactorGetData()
}

protocol TvShowsDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol TvShowsRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: TvShowsRemoteDataManagerOutputProtocol? { get set }
    func externalGetData()
}

protocol TvShowsRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteCallBackData(with category: [TvShow])
}

protocol TvShowsLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
