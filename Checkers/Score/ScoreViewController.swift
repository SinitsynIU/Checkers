//
//  ScoreViewController.swift
//  Checkers
//
//  Created by Илья Синицын on 01.03.2022.
//

import UIKit
import GoogleMobileAds

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var clearButton: ButtonCustom!
    @IBOutlet weak var backButton: ButtonCustom!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bunnerView: GADBannerView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocalization()
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ScoreTableViewCell", bundle: nil), forCellReuseIdentifier: "ScoreTableViewCell")
        AdsManager.shared.setupBunner(bannerView: bunnerView, viewController: self)
    }
    
    func setupLocalization() {
        scoreLabel.text = "scoreLabel_text_startGameVC".localized
        backButton.text = "backButton_text_setVC".localized
        clearButton.text = "clearButton_text_scoreVC".localized
    }
    
    private func setupUI() {
        self.overrideUserInterfaceStyle = .light
        if UserDefaults.standard.colorForKey(key: "bgColor") == nil {
            view.backgroundColor = .white
        } else {
        view.backgroundColor = UserDefaults.standard.colorForKey(key: "bgColor")
        }
    }
    
    @IBAction func buttonClearAction(_ sender: Any) {
        
    }
    
    @IBAction func buttonBackAction(_ sender: Any) {
        if let vc = UIStoryboard(name: "PlayerViewController", bundle: nil).instantiateInitialViewController() as? PlayerViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ScoreViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreTableViewCell") as? ScoreTableViewCell else {
            return UITableViewCell()
        }
        cell.winnerGrayPlayer.isHidden = true
        cell.winnerWhitePlayer.isHidden = true
        return cell
    }
}

extension ScoreViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
}
