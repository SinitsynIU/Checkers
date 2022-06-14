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
    @IBOutlet weak var whitePlayerScoreTextLabel: UILabel!
    @IBOutlet weak var gameTimerTextLabel: UILabel!
    @IBOutlet weak var greyPlayerScoreTextLabel: UILabel!
    @IBOutlet weak var scoreGrayPlayerLabel: UILabel!
    @IBOutlet weak var winnerGrayPlayer: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var url: URL?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLocalization()
        winnerWhitePlayer.isHidden = true
        winnerGrayPlayer.isHidden = true
    }
    
    func setupLocalization() {
        gameTimerTextLabel.text = "timerGame_text_scoreCell".localized
        greyPlayerScoreTextLabel.text = "scoreLabel_text_startGameVC".localized
        whitePlayerScoreTextLabel.text = "scoreLabel_text_startGameVC".localized
    }
    
    override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
