
import UIKit
import LTMorphingLabel

class Checker: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var color: UIColor
    var numberCell: Int
    
    init(color: UIColor, numberCell: Int) {
        self.color = color
        self.numberCell = numberCell
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(color, forKey: "color")
        coder.encode(numberCell, forKey: "numberCell")
    }
    
    required init?(coder: NSCoder) {
        self.numberCell = coder.decodeInteger(forKey: "numberCell")
        self.color = coder.decodeObject(of: UIColor.self, forKey: "color") ?? .white
    }
}

enum currentMove: Int {
    case white = 0
    case gray = 1
}

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
    
    var checkers: [Checkers] = []
    var choseChekerPlayer: String?
    var scoreWhitePlayer: Int = 0
    var scoreGreyPlayer: Int = 0
    var viewBoard = UIView()
    var checkersSave: [Checker] = []
    var timer: Timer!
    var image: UIImage?
    var currentPlayerMove: currentMove = nil ?? .white
    var seconds: Int = 0 {
        didSet {
            let min = Int(Double(seconds) / 60.0)
            let sec = Int(Double(seconds) - (Double(min) * 60.0))
            let min_string = min < 10 ? "0\(min)" : "\(min)"
            let sec_string = sec < 10 ? "0\(sec)" : "\(sec)"
            timerLabel.text = " \(min_string):\(sec_string) "
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AdsManager.shared.setupInterstitial(viewController: self) {
            print("Failed to load interstitial ad with error")
        }
        addView()
        setupUI()
        setupLocalization()
    }
    
   private func setupUI() {
        if UserDefaults.standard.colorForKey(key: "bgColor") == nil {
            view.backgroundColor = .white
        } else {
        view.backgroundColor = UserDefaults.standard.colorForKey(key: "bgColor")
        }
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
        choseChekerPlayerFunc()
    }
    
    private func saveData() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let date: String =  dateFormatter.string(from: Date.now)
    
        checkers.append(Checkers(nameWhitePlayer: whitePlayerName.text, nameGreyPlayer: grayPlayerName.text, timer: timerLabel.text, scoreGreyPlayer: scoreGreyPlayer, scoreWhitePlayer: scoreWhitePlayer, date: date))
        CoreDataManager.shared.saveGameInDB(checkers: checkers)
        
    }
    
    private func choseChekerPlayerFunc() {
        guard let playerName1 = UserDefaults.standard.object(forKey: "userName"), let playerName2 = UserDefaults.standard.object(forKey: "secondUserName") else { return }
        if choseChekerPlayer == "white" {
                whitePlayerName.text = " \(playerName1) "
                grayPlayerName.text = " \(playerName2) "
        }
        if choseChekerPlayer == "gray" {
                whitePlayerName.text = " \(playerName2) "
                grayPlayerName.text = " \(playerName1) "
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
        let alert = UIAlertController(title: nil, message: "buttonSaveAlert_message_startGameVC".localized, preferredStyle: .alert)
        let yes = UIAlertAction(title: "buttonSaveAlertYes_message_startGameVC".localized, style: .default) { _ in
            self.checkersSave.removeAll()
            for view in self.viewBoard.subviews {
                if !view.subviews.isEmpty{
                    guard let color = view.subviews.first?.backgroundColor else { return }
                    self.checkersSave.append(Checker(
                                                color: color, numberCell: view.tag))
                }
            }
            if let data = try? NSKeyedArchiver.archivedData(withRootObject: self.checkersSave, requiringSecureCoding: true) {
                UserDefaults.standard.set(data, forKey: "Checkers")
            }
        }
        UserDefaults.standard.set(seconds, forKey: "timerGame")
        UserDefaults.standard.set(currentPlayerMove.rawValue, forKey: "playerMove")
        UserDefaults.standard.set(movePlayerLabel.text, forKey: "move")
        UserDefaults.standard.set(choseChekerPlayer, forKey: "chosePlayerCheker")
        UserDefaults.standard.set(scoreWhitePlayer, forKey: "scoreWhitePlayer")
        UserDefaults.standard.set(scoreGreyPlayer, forKey: "scoreGreyPlayer")
        let no = UIAlertAction(title: "buttonSaveAlertNo_message_startGameVC".localized, style: .destructive, handler: nil)
        alert.addAction(no)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func buttonResetTapAction(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "buttonResetAlert_message_startGameVC".localized, preferredStyle: .alert)
        let yes = UIAlertAction(title: "buttonSaveAlertYes_message_startGameVC".localized, style: .default) { _ in
            for view in self.viewBoard.subviews {
                view.removeFromSuperview()
            }
            self.printViewCheckersBoard()
            self.view.addSubview(self.viewBoard)
            self.currentPlayerMove = .white
            self.choseChekerPlayerFunc()
            self.movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
            self.timer.invalidate()
            self.seconds = 0
            self.scoreGreyPlayer = 0
            self.scoreWhitePlayer = 0
            self.whitePleyerScore.text = "\(self.scoreWhitePlayer)"
            self.greyPlayerScore.text = "\(self.scoreGreyPlayer)"
            self.timerGame()
        }
        let no = UIAlertAction(title: "buttonSaveAlertNo_message_startGameVC".localized, style: .destructive, handler: nil)
        alert.addAction(no)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
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
        if let i = UserDefaults.standard.value(forKey: "playerMove") {
            let playerMove = currentMove(rawValue: i as! Int) ?? .gray
            currentPlayerMove = playerMove
        }
        movePlayerLabel.text = UserDefaults.standard.string(forKey: "move")
        greyPlayerScore.text = "\(UserDefaults.standard.integer(forKey: "scoreGreyPlayer"))"
        whitePleyerScore.text = "\(UserDefaults.standard.integer(forKey: "scoreWhitePlayer"))"
        
        if let chosePlayer = UserDefaults.standard.string(forKey: "chosePlayerCheker") {
            guard let  playerName1 = UserDefaults.standard.object(forKey: "userName"), let  playerName2 = UserDefaults.standard.object(forKey: "secondUserName") else { return }
            if chosePlayer == "white" {
                whitePlayerName.text = " \(playerName1) "
                grayPlayerName.text = " \(playerName2) "
            }
            if chosePlayer == "gray" {
                whitePlayerName.text = " \(playerName2) "
                grayPlayerName.text = " \(playerName1) "
            }
        }
            
        if let data = UserDefaults.standard.object(forKey: "Checkers") as? Data { if let checkers = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Checker] {
            self.checkersSave = checkers }
        }
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
        if let timerLoad = UserDefaults.standard.value(forKey: "timerGame") {
                self.seconds = timerLoad as! Int
                    if self.timer == nil {
                        self.timerGame()
                        return
                    }
                    if self.timer.isValid {
                        self.timer.invalidate()
                    } else {
                        self.timerGame()
                    }
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
            finishAlert(winnerName: winnerName ?? "")
        }
        if scoreWhitePlayer == 12 {
            winnerName = whitePlayerName.text
            finishAlert(winnerName: winnerName ?? "")
        }
    }
    
   private func finishAlert(winnerName: String) {
       let alert = UIAlertController(title: "finishGameAlert_text_winnerPlayerWinner_text_scoreVC".localized, message: "\(winnerName)" + "finishGameAlert_massage_startGameVC".localized, preferredStyle: .alert)
       let ok = UIAlertAction(title: "OK", style: .default) { _ in
           
           self.saveData()
           self.timer.invalidate()
           guard let vc = PlayerViewController.getInstanceViewController as? PlayerViewController else { return }
           self.navigationController?.pushViewController(viewController: vc, animated: true, completion: {
               
               UserDefaults.standard.removeObject(forKey: "secondUserName")
               UserDefaults.standard.removeObject(forKey: "scoreGreyPlayer")
               UserDefaults.standard.removeObject(forKey: "scoreWhitePlayer")
               UserDefaults.standard.removeObject(forKey: "Checkers")
               UserDefaults.standard.removeObject(forKey: "timerGame")
               UserDefaults.standard.removeObject(forKey: "playerMove")
               UserDefaults.standard.removeObject(forKey: "move")
               UserDefaults.standard.removeObject(forKey: "chosePlayerCheker")
               
           })
       }
       alert.addAction(ok)
       present(alert, animated: true, completion: nil)
    }
}
