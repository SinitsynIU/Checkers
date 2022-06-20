//
//  ScoreTableViewCell.swift
//  Checkers
//
//  Created by Илья Синицын on 01.03.2022.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {
   
    @IBOutlet weak var greyPlayerName: UILabel!
    @IBOutlet weak var scoreContentView: UIView!
    @IBOutlet weak var whitePlayerName: UILabel!
    @IBOutlet weak var timerGameLabel: UILabel!
    @IBOutlet weak var scoreWhitePlayerLabel: UILabel!
    @IBOutlet weak var winnerWhitePlayer: UILabel!
    @IBOutlet weak var whitePlayerScoreTextLabel: UILabel!
    @IBOutlet weak var greyPlayerScoreTextLabel: UILabel!
    @IBOutlet weak var scoreGrayPlayerLabel: UILabel!
    @IBOutlet weak var winnerGrayPlayer: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var url: URL?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLocalization()
        setupUI()
        winnerWhitePlayer.isHidden = true
        winnerGrayPlayer.isHidden = true
    }
    
    private func setupLocalization() {
        greyPlayerScoreTextLabel.text = "scoreLabel_text_startGameVC".localized
        whitePlayerScoreTextLabel.text = "scoreLabel_text_startGameVC".localized
    }
    
    private func setupUI() {
        scoreContentView.layer.borderWidth = 1
        scoreContentView.layer.cornerRadius = 30
    }
}
