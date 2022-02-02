//
//  NewsTableViewCell.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {


    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleSourceNameLbl: UILabel!
    @IBOutlet weak var articleTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func populateWithViewModel(cellViewModel: NewsTableViewCellViewModel) {
        articleTitleLbl.text = cellViewModel.articleTitle
        articleSourceNameLbl.text = cellViewModel.articleSourceName
        let url = URL(string: cellViewModel.articleImage )
        articleImage.kf.setImage(with: url)
    }
    
}
