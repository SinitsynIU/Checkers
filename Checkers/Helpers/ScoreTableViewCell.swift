//
//  ScoreTableViewCell.swift
//  Checkers
//
//  Created by Илья Синицын on 01.03.2022.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {
   
    @IBOutlet weak var greyPlayerName: UILabel!
    @IBOutlet weak var whitePlayerName: UILabel!
    @IBOutlet weak var timerGameLabel: UILabel!
    @IBOutlet weak var scoreWhitePlayerLabel: UILabel!
    @IBOutlet weak var winnerWhitePlayer: UILabel!
    @IBOutlet weak var scoreGrayPlayerLabel: UILabel!
    @IBOutlet weak var winnerGrayPlayer: UILabel!
    var url: URL?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLang()
    }
    
    func setupLang() {
        if UserDefaults.standard.string(forKey: "language") == nil {
            url = Bundle.main.url(forResource: "en", withExtension: "lproj")
        } else {
            url = Bundle.main.url(forResource: UserDefaults.standard.string(forKey: "language"), withExtension: "lproj")
        }
        guard let langBandel = Bundle(url: url!.absoluteURL) else { return }
        timerGameLabel.text = NSLocalizedString("timerGame_text_scoreCell", bundle: langBandel, comment: "")
        scoreGrayPlayerLabel.text = NSLocalizedString("scoreLabel_text_startGameVC", bundle: langBandel, comment: "")
        scoreWhitePlayerLabel.text = NSLocalizedString("scoreLabel_text_startGameVC", bundle: langBandel, comment: "")
    }
}
