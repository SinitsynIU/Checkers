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
    
    var checkers: [Checkers] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocalization()
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ScoreTableViewCell", bundle: nil), forCellReuseIdentifier: "ScoreTableViewCell")
        AdsManager.shared.setupBunner(bannerView: bunnerView, viewController: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(CheckersDataBaseDidChange), name: NSNotification.Name("CheckersDataBaseDidChange"), object: nil)
    }
                                               
    @objc func CheckersDataBaseDidChange() {
        getData()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }
    
    private func getData() {
        let checkersDB = CoreDataManager.shared.getFromDB()
        checkers = checkersDB
    }
    
    private func setupLocalization() {
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
        clearButton.isHidden = true
    }
    
    @IBAction func buttonClearAction(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "clearButtonAlert_message_scoreVC".localized, preferredStyle: .alert)
        let yes = UIAlertAction(title: "buttonSaveAlertYes_message_startGameVC".localized, style: .default) { _ in
            self.checkers.removeAll()
            CoreDataManager.shared.deleteAllInDB()
            self.tableView.reloadData()
        }
        let no = UIAlertAction(title: "buttonSaveAlertNo_message_startGameVC".localized, style: .destructive, handler: nil)
        alert.addAction(no)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func buttonBackAction(_ sender: Any) {
        guard let vc = PlayerViewController.getInstanceViewController as? PlayerViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ScoreViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if checkers.count > 0 {
            clearButton.isHidden = false
        }
        return checkers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreTableViewCell") as? ScoreTableViewCell else                                                                             { return UITableViewCell() }
        
        cell.selectionStyle = .none
    
        let checkerSave = checkers[indexPath.row]
        cell.whitePlayerName.text = "\(checkerSave.nameWhitePlayer ?? "")"
        cell.greyPlayerName.text = "\(checkerSave.nameGreyPlayer ?? "")"
        cell.scoreGrayPlayerLabel.text = "\(checkerSave.scoreGreyPlayer ?? 0)"
        cell.scoreWhitePlayerLabel.text = "\(checkerSave.scoreWhitePlayer ?? 0)"
        cell.timerGameLabel.text = "\(checkerSave.timer ?? "")"
        cell.dateLabel.text = "\(checkerSave.date ?? "")"
    
        guard let greyPlayerScore = checkerSave.scoreGreyPlayer, let whitePlayerScore = checkerSave.scoreWhitePlayer else { return cell }
        if greyPlayerScore > whitePlayerScore {
            cell.winnerGrayPlayer.isHidden = false
            cell.winnerGrayPlayer.text = "winnerPlayerWinner_text_scoreVC".localized
        } else {
            if whitePlayerScore > greyPlayerScore {
                cell.winnerWhitePlayer.isHidden = false
                cell.winnerWhitePlayer.text = "winnerPlayerWinner_text_scoreVC".localized
            } else {
                cell.winnerGrayPlayer.isHidden = false
                cell.winnerWhitePlayer.isHidden = false
                cell.winnerGrayPlayer.text = "winnerPlayerTie_text_scoreVC".localized
                cell.winnerWhitePlayer.text = "winnerPlayerTie_text_scoreVC".localized
            }
        }
        return cell
    }
}

extension ScoreViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155.0
    }
}
