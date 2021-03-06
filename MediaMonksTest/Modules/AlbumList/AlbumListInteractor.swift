//
//  AlbumListInteractor.swift
//  MediaMonksTest
//
//  Created Miguel Vicario on 06/01/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

public class AlbumListInteractor: AlbumListInteractorProtocol {

    weak var presenter: AlbumListPresenterProtocol?
    
    //MARK: - Properties
    let networkConnection: NetworkConnection = NetworkConnection()
    
    //MARK: - MakeRequest
    func makeRequest(method: Method) {
        networkConnection.delegate = self
        networkConnection.makeRequest(withMethod: method, dataType: Albums.self)
    }
}

//MARK: - NetworkConnectionDelegate
extension AlbumListInteractor: NetworkConnectionDelegate {
    func dataReceived<T: Codable>(object: T) {
        let albums = object as! Albums
        presenter?.receivedData(data: albums)
    }
    
    func failedRequest(error: Errors) {
        presenter?.error(message: error.getErrorMessage())
    }
}
