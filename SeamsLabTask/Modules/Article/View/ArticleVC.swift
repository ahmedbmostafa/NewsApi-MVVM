//
//  ArticleVC.swift
//  SeamsLabTask
//
//  Created by ahmed mostafa on 31/01/2022.
//

import UIKit
import Kingfisher

class ArticleVC: UIViewController {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var articleDateLbl: UILabel!
    @IBOutlet weak var shadeView: UIView!
    @IBOutlet weak var rateTxtF: UITextField!

    var viewModel: ArticleViewModelProtocol!

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.5647058824, blue: 0.6901960784, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModelOutput()
        viewModel.didLoad()
        setUpRateView()
    }

    func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            guard let self = self else { return }

            switch output {
            case .showArticleImage(url: let url):
                self.articleImage.kf.setImage(with: url)
            case .showArticleeDescription(description: let description):
                self.descriptionLbl.text = description
            case .showArticleContent(content: let content):
                self.contentLbl.text = content
            case .showArticlePublishedAt(date: let date):
                self.articleDateLbl.text = date
            }
        }
    }

    func setUpRateView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissView(){
        shadeView.alpha = 0
    }

    @IBAction func showRateBtnTapped(_ sender: Any) {
        rateTxtF.text = ""
        shadeView.alpha = 1
    }

    @IBAction func rateBtnTapped(_ sender: Any) {
        guard let rateTxt = rateTxtF.text else {return}
        let isChecked = viewModel.checkRateText(text: rateTxt)
        if  isChecked {
            shadeView.alpha = 0
            view.makeToast("Done successfuly")
        } else {
            let err = "Invalid Rate"
            UIAlertController.showAlert(withMessage: err)
        }
    }

    @IBAction func closeBtnTapped(_ sender: Any) {
        shadeView.alpha = 0
    }
}
