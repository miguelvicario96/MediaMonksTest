//
//  AlbumListViewController.swift
//  MediaMonksTest
//
//  Created Miguel Vicario on 06/01/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

public class AlbumListViewController: UIViewController, AlbumListViewProtocol {

	var presenter: AlbumListPresenterProtocol?
    
    //MARK: - @IBOutlets
    @IBOutlet weak var tableView: UITableView! {
        didSet { tableView.tableFooterView = UIView() }
    }
    
    //MARK: - Properties
    var albums: Albums? {
        didSet { tableView.reloadData() }
    }

    //MARK: - Life cycle
	override public func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        presenter?.makeRequest(method: .albums)
    }
    
    //MARK: - Methods
    private func setUpView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 45
        tableView.register(AlbumTVC.nib, forCellReuseIdentifier: AlbumTVC.identifier)
    }
    
    //MARK: - @IBActions
    @IBAction private func goBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - PresenterMethods
extension AlbumListViewController {
    func receivedData(data: Albums) {
        albums = data
    }
    
    func error(message: String) {
        print(message)
    }
}

//MARK: - UITableViewDataSource
extension AlbumListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRows = albums?.count else { return 0 }
        return numberOfRows
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTVC.identifier, for: indexPath) as! AlbumTVC
        guard let album = albums?[indexPath.row] else { return UITableViewCell() }
        cell.setModel(album: album)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension AlbumListViewController: UITableViewDelegate {
    
}
