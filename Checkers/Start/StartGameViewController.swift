
import UIKit
import LTMorphingLabel

class StartGameViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var gameCheckers: LTMorphingLabel!
    @IBOutlet weak var whitePlayerName: UILabel!
    @IBOutlet weak var whitePleyerScore: UILabel!
    @IBOutlet weak var grayPlayerView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var whitePlayerView: UIView!
    @IBOutlet weak var grayPlayerName: UILabel!
    @IBOutlet weak var greyPlayerScore: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var buttonSave: ButtonCustom!
    @IBOutlet weak var buttonReset: ButtonCustom!
    @IBOutlet weak var buttonBack: ButtonCustom!
    @IBOutlet weak var movePlayerLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    enum currentMove: String {
        case white
        case gray
    }
    
    private lazy var alertView: AlertView = {
        let alertView: AlertView = AlertView.loadFromNib()
        alertView.delegateLeftButton = self
        alertView.delegateRightButton = self
        return alertView
    }()
    
    var saveButtonControl: Bool?
    var resetButtonControl: Bool?
    
    var checkers: [Checkers] = []
    var choseChekerPlayer: String?
    var scoreWhitePlayer: Int = 0
    var scoreGreyPlayer: Int = 0
    var viewBoard = UIView()
    var checkersSave: [CheckerCodingModel] = []
    var timer: Timer!
    var image: UIImage?
    var currentPlayerMove: currentMove = nil ?? .white
    var seconds: Int = 0 {
        didSet {
            let hour = Int(seconds / 3600)
            let min = Int((seconds / 60) % 60)
            let sec = Int(seconds % 60)
            let min_string = min < 10 ? "0\(min)" : "\(min)"
            let sec_string = sec < 10 ? "0\(sec)" : "\(sec)"
            let hour_string = hour < 10 ? "0\(hour)" : "\(hour)"
            if hour == 0 {
                timerLabel.text = " \(min_string):\(sec_string) "
            } else {
                timerLabel.text = " \(hour_string):\(min_string):\(sec_string) "
            }
        }
    }
    var arrayOfPossibleStepsGray = [Int]()
    var arrayOfPossibleStepsWhite = [Int]()
    var arrayOfPossibleStepsQueenBlue = [Int]()
    var arrayOfPossibleStepsQueenRed = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AdsManager.shared.setupInterstitial(viewController: self) {
            print("Failed to load interstitial ad with error")
        }
        addView()
        setupUI()
        getUserSettings()
        choseChekerPlayerFunc()
        setupLocalization()
        if UserDefaultsSettings.checkerModel == nil {
            timerGame()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaultsSettings.checkerModel != nil {
            gameLoad()
        }
    }
    
    func setAlert(saveButton: Bool? = nil, winnerName: String? = nil) {
        view.addSubview(alertView)
        alertView.center = view.center
        if saveButton == true {
            alertView.set(title: "saveAlert_text_startGameVC".localized, body: "buttonStartAlert_message_playerVC".localized, leftButtonTitle: "buttonSaveAlertYes_message_startGameVC".localized, rightButtonTitle: "buttonSaveAlertNo_message_startGameVC".localized)
        } else if saveButton == false {
            alertView.set(title: "resetAlert_text_startGameVC".localized, body: "buttonResetAlert_message_startGameVC".localized, leftButtonTitle: "buttonSaveAlertYes_message_startGameVC".localized, rightButtonTitle: "buttonSaveAlertNo_message_startGameVC".localized)
        } else {
            alertView.set(title: "finishGameAlert_text_winnerPlayerWinner_text_scoreVC".localized, body: "\(winnerName ?? "")" + " " + "finishGameAlert_massage_startGameVC".localized, leftButtonTitle: "OK")
        }
    }
    
    func animateIn() {
        alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        alertView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.alertView.alpha = 1
            self.alertView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.4,
                       animations: {
                        self.alertView.alpha = 0
                        self.alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        }) { (_) in
           self.alertView.removeFromSuperview()
        }
    }
    
   private func setupUI() {
        self.overrideUserInterfaceStyle = .light
        gameCheckers.morphingCharacterDelay = 1.0
        gameCheckers.morphingEffect = .fall
        movePlayerLabel.text = nil
        gameCheckers.text = " Checkers "
        movePlayerLabel.textColor = .magenta
        whitePlayerView.layer.cornerRadius = 15
        whitePlayerView.layer.borderWidth = 1
        grayPlayerView.layer.cornerRadius = 15
        grayPlayerView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 30
    }
    
    private func getUserSettings () {
        if UserDefaultsSettings.choseChackerPlaying == nil {
            choseChekerPlayer = "white"
        } else {
            choseChekerPlayer = UserDefaultsSettings.choseChackerPlaying
        }
        if UserDefaultsSettings.backgroundColor == nil {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = UserDefaultsSettings.backgroundColor
        }
    }
    
    private func saveData() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let date: String =  dateFormatter.string(from: Date.now)
    
        checkers.append(Checkers(nameWhitePlayer: whitePlayerName.text, nameGreyPlayer: grayPlayerName.text, timer: timerLabel.text, scoreGreyPlayer: scoreGreyPlayer, scoreWhitePlayer: scoreWhitePlayer, date: date))
        CoreDataManager.shared.saveGameInDB(checkers: checkers)
        
    }
    
    private func choseChekerPlayerFunc() {
        if choseChekerPlayer == "white" {
            whitePlayerName.text = "\(UserDefaultsSettings.firstPlayerName ?? "")"
            grayPlayerName.text = "\(UserDefaultsSettings.secondPlayerName ?? "")"
        }
        if choseChekerPlayer == "gray" {
                whitePlayerName.text = "\(UserDefaultsSettings.secondPlayerName ?? "")"
                grayPlayerName.text = "\(UserDefaultsSettings.firstPlayerName ?? "")"
        }
    }
    
    private func addView() {
        printViewCheckersBoard()
        [viewBoard].forEach({view.addSubview($0)})
    }
    
    private func setupLocalization() {
        gameCheckers.text = "gameCheckers_text_startGameVC".localized
        scoreLabel.text = "scoreLabel_text_startGameVC".localized
        buttonBack.text = "backButton_text_setVC".localized
        buttonSave.text = "saveButton_text_setVC".localized
        buttonReset.text = "resetButton_text_startGameVC".localized
        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
    }
    
    private func printViewCheckersBoard () {
        viewBoard = UIView(frame: CGRect(origin: .zero,
                                         size: CGSize(
                                            width: UIScreen.main.bounds.width - 32.0,
                                            height: UIScreen.main.bounds.width - 32.0)))
        viewBoard.center = view.center
        viewBoard.layer.borderWidth = 2
        viewBoard.layer.borderColor = UIColor.black.cgColor
        var number: Int = 0
        for j in 0..<8 {
            for i in 0..<8 {
                let square = UIView(frame: CGRect(
                    x: CGFloat(i) * ((UIScreen.main.bounds.width - 32.0) / Double (8)),
                    y: CGFloat(j) * ((UIScreen.main.bounds.width - 32.0) / Double (8)),
                    width: (UIScreen.main.bounds.width - 32.0) / Double (8),
                    height: (UIScreen.main.bounds.width - 32.0) / Double (8)))
                viewBoard.addSubview(square)
                let isWhite = (j + i) % 2 == 0
                square.backgroundColor = isWhite ? .white : .black
                square.tag = number
                number += 1
                if j <= 2 && !isWhite {
                    let checker = getCheckers(color: .white, position: square)
                    if square.backgroundColor == .black {
                        square.addSubview(checker)
                    }
                } else if j >= 5 && !isWhite {
                    let checker = getCheckers(color: .gray, position: square)
                    if square.backgroundColor == .black {
                        square.addSubview(checker)
                    }
                    square.bringSubviewToFront(checker)
                }
            }
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
      return true
    }
    
    private func createGestureRecognizer () -> [UIGestureRecognizer] {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture))
        longPressGesture.minimumPressDuration = 0.1
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handPanGesture))
        longPressGesture.delegate = self
        panGesture.delegate = self
        return [panGesture, longPressGesture]
    }
    
    private func getCheckers (color: UIColor, position: UIView) -> UIView {
        let checker = UIView(frame: CGRect(origin: CGPoint(
            x: position.frame.height / 6,
            y: position.frame.height / 6),
                                           size: CGSize(
                                            width: position.frame.height / 1.5,
                                            height: position.frame.height / 1.5)))
        checker.backgroundColor = color
        checker.layer.cornerRadius = position.frame.height / 3
        checker.isUserInteractionEnabled = true
        checker.layer.borderWidth = 2
        checker.layer.borderColor = UIColor.lightGray.cgColor
        createGestureRecognizer().forEach { checker.addGestureRecognizer($0) }
        return checker
    }
    
    @IBAction func buttonSaveTapAction(_ sender: Any) {
            saveButtonControl = true
            setAlert(saveButton: true)
            animateIn()
    }
    
    @IBAction func buttonResetTapAction(_ sender: Any) {
        resetButtonControl = true
        setAlert(saveButton: false)
        animateIn()
    }
    
    @IBAction func buttonBackTapAction(_ sender: Any) {
        guard let vc = PlayerViewController.getInstanceViewController as? PlayerViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
        timer.invalidate()
    }
    
    func gameLoad() {
        for view in self.viewBoard.subviews {
            view.subviews.forEach { $0.removeFromSuperview() }
        }
        currentPlayerMove = currentMove(rawValue: UserDefaultsSettings.currentMove ?? "") ?? .gray
        movePlayerLabel.text = "\(UserDefaultsSettings.playerMove ?? "White move!")"
        greyPlayerScore.text = "\(UserDefaultsSettings.scoreSecondPlayer ?? 0)"
        whitePleyerScore.text = "\(UserDefaultsSettings.scoreFirstPlayer ?? 0)"
        if UserDefaultsSettings.choseChackerPlaying == "white" {
            whitePlayerName.text = "\(UserDefaultsSettings.firstPlayerName ?? "")"
            grayPlayerName.text = "\(UserDefaultsSettings.secondPlayerName ?? "")"
        }
        if UserDefaultsSettings.choseChackerPlaying == "gray" {
            whitePlayerName.text = "\(UserDefaultsSettings.secondPlayerName ?? "")"
            grayPlayerName.text = "\(UserDefaultsSettings.firstPlayerName ?? "")"
        }
        self.checkersSave = UserDefaultsSettings.checkerModel ?? []
        
        for view in self.viewBoard.subviews {
            if let checker = self.checkersSave.first(where:
                                                    { $0.numberCell == view.tag }) {
                if view.subviews.isEmpty {
                    let subview = self.getCheckers(
                                            color: checker.color, position: view)
                        view.addSubview(subview)
                }
            }
        }
        seconds = UserDefaultsSettings.timer ?? 0
        if timer == nil {
            timerGame()
            return
        }
        if timer.isValid {
            timer.invalidate()
        } else {
            timerGame()
        }
    }
    
    func timerGame() {
        timer = Timer(timeInterval: 0.1, repeats: true) { _ in
            self.seconds += 1
        }
        RunLoop.main.add(timer, forMode: .common)
    }
    
   func gameIsFinish() {
        var winnerName: String?
        
        if scoreGreyPlayer == 12 {
            winnerName = grayPlayerName.text
            setAlert(winnerName: winnerName)
            animateIn()
        }
        if scoreWhitePlayer == 12 {
            winnerName = whitePlayerName.text
            setAlert(winnerName: winnerName)
            animateIn()
        }
    }
}

extension StartGameViewController: AlertDelegateLeftButton, AlertDelegateRightButton {
    
    func leftButtonTapped() {
        animateOut()
        if saveButtonControl != nil {
            checkersSave.removeAll()
            for view in self.viewBoard.subviews {
                if !view.subviews.isEmpty{
                    guard let color = view.subviews.first?.backgroundColor else { return }
                    checkersSave.append(CheckerCodingModel(color: color, numberCell: view.tag))
                }
            }
            UserDefaultsSettings.checkerModel = checkersSave
            UserDefaultsSettings.timer = seconds
            UserDefaultsSettings.currentMove = currentPlayerMove.rawValue
            UserDefaultsSettings.playerMove = movePlayerLabel.text
            UserDefaultsSettings.choseChackerPlaying = choseChekerPlayer
            UserDefaultsSettings.scoreFirstPlayer = scoreWhitePlayer
            UserDefaultsSettings.scoreSecondPlayer = scoreGreyPlayer
            saveButtonControl = nil
        } else if resetButtonControl != nil {
            for view in viewBoard.subviews {
                view.removeFromSuperview()
            }
            printViewCheckersBoard()
            view.addSubview(viewBoard)
            currentPlayerMove = .white
            choseChekerPlayerFunc()
            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
            timer.invalidate()
            seconds = 0
            scoreGreyPlayer = 0
            scoreWhitePlayer = 0
            whitePleyerScore.text = "\(scoreWhitePlayer)"
            greyPlayerScore.text = "\(scoreGreyPlayer)"
            timerGame()
            resetButtonControl = nil
        } else {
            animateOut()
            saveData()
            timer.invalidate()
            UserDefaultsSettings.UserDefaultsRemoveGameIsFinish()
            guard let vc = PlayerViewController.getInstanceViewController as? PlayerViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func rightButtonTapped() {
        animateOut()
    }
}
