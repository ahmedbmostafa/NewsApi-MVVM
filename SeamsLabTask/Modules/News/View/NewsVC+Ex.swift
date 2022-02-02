//
//  NewsVC+Ex.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import UIKit

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfNews
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {return UITableViewCell()}

        let cellViewModel = viewModel.getNewsCellViewModel(index: indexPath.row)
        cell.populateWithViewModel(cellViewModel: cellViewModel)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectNews(index: indexPath.row)
    }
}
