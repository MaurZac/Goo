//
//  TvShowsWireFrame.swift
//  Goo
//
//  Created by Mauricio Zarate Chula on 19/08/22.
//  
//

import Foundation
import UIKit

class TvShowsWireFrame: TvShowsWireFrameProtocol {

    class func createTvShowsModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "TvShowsView")
        if let view = navController  as? TvShowsView {
            let presenter: TvShowsPresenterProtocol & TvShowsInteractorOutputProtocol = TvShowsPresenter()
            let interactor: TvShowsInteractorInputProtocol & TvShowsRemoteDataManagerOutputProtocol = TvShowsInteractor()
            let localDataManager: TvShowsLocalDataManagerInputProtocol = TvShowsLocalDataManager()
            let remoteDataManager: TvShowsRemoteDataManagerInputProtocol = TvShowsRemoteDataManager()
            let wireFrame: TvShowsWireFrameProtocol = TvShowsWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "TvShowsView", bundle: Bundle.main)
    }
    
}
