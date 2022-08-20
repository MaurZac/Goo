//
//  TvShowsRemoteDataManager.swift
//  Goo
//
//  Created by Mauricio Zarate Chula on 19/08/22.
//  
//

import Foundation

class TvShowsRemoteDataManager:TvShowsRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: TvShowsRemoteDataManagerOutputProtocol?
    
    func externalGetData() {
          guard let url = URL(string: "http://api.tvmaze.com/shows") else { return }
          let task = URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  if let res = try? JSONDecoder().decode([TvShow].self, from: data) {
                      
                      self.remoteRequestHandler?.remoteCallBackData(with: res)
                  } else {
                      print("Invalid Response")
                  }
              } else if let error = error {
                  print("HTTP Request Failed \(error)")
              }
          }
          task.resume()
      }
    
}
