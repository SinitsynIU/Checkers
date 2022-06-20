//
//  Logics.swift
//  Checkers
//
//  Created by Илья Синицын on 16.06.2022.
//

import UIKit

extension StartGameViewController {
    
    func moveGrayChecker(_ sender: UIPanGestureRecognizer, board: UIView) -> Bool {
        guard let checker = sender.view, let checkerSquare = checker.superview else { return true}
        var takeStep: Bool?
        let filterSevenTop = board.subviews.filter{($0.tag == (checkerSquare.tag) + 7)}
        let filterNineTop = board.subviews.filter{($0.tag == (checkerSquare.tag) + 9)}
        let filterSevenBottom = board.subviews.filter{($0.tag == (checkerSquare.tag) - 7)}
        let filterNineBottom = board.subviews.filter{($0.tag == (checkerSquare.tag) - 9)}
        for view in board.subviews {
            if checker.backgroundColor == .gray, view.tag == (checkerSquare.tag + 14) {
                if view.subviews.isEmpty, view.backgroundColor != .white, filterSevenTop.first?.subviews.first?.backgroundColor == .white {
                    takeStep = true
                }
            } else {
                if checker.backgroundColor == .gray, view.tag == (checkerSquare.tag + 18) {
                    if view.subviews.isEmpty, view.backgroundColor != .white, filterNineTop.first?.subviews.first?.backgroundColor == .white {
                        takeStep = true
                    }
                } else {
                    if checker.backgroundColor == .gray, view.tag == (checkerSquare.tag - 14) {
                        if view.subviews.isEmpty, view.backgroundColor != .white, filterSevenBottom.first?.subviews.first?.backgroundColor == .white {
                            takeStep = true
                        }
                    } else {
                        if checker.backgroundColor == .gray, view.tag == (checkerSquare.tag - 18) {
                            if view.subviews.isEmpty, view.backgroundColor != .white, filterNineBottom.first?.subviews.first?.backgroundColor == .white {
                                takeStep = true
                            }
                        }
                    }
                }
            }
        }
        return takeStep ?? false
    }
    
    func moveWhiteChecker(_ sender: UIPanGestureRecognizer, board: UIView) -> Bool {
        guard let checker = sender.view, let checkerSquare = checker.superview else { return true}
        var takeStep: Bool?
        let filterSevenTop = board.subviews.filter{($0.tag == (checkerSquare.tag) + 7)}
        let filterNineTop = board.subviews.filter{($0.tag == (checkerSquare.tag) + 9)}
        let filterSevenBottom = board.subviews.filter{($0.tag == (checkerSquare.tag) - 7)}
        let filterNineBottom = board.subviews.filter{($0.tag == (checkerSquare.tag) - 9)}
        for view in board.subviews {
            if checker.backgroundColor == .white, view.tag == (checkerSquare.tag + 14) {
                if view.subviews.isEmpty, view.backgroundColor != .white, filterSevenTop.first?.subviews.first?.backgroundColor == .gray {
                    takeStep = true
                }
            } else {
                if checker.backgroundColor == .white, view.tag == (checkerSquare.tag + 18) {
                    if view.subviews.isEmpty, view.backgroundColor != .white, filterNineTop.first?.subviews.first?.backgroundColor == .gray {
                        takeStep = true
                    }
                } else {
                    if checker.backgroundColor == .white, view.tag == (checkerSquare.tag - 14) {
                        if view.subviews.isEmpty, view.backgroundColor != .white, filterSevenBottom.first?.subviews.first?.backgroundColor == .gray {
                            takeStep = true
                        }
                    } else {
                        if checker.backgroundColor == .white, view.tag == (checkerSquare.tag - 18) {
                            if view.subviews.isEmpty, view.backgroundColor != .white, filterNineBottom.first?.subviews.first?.backgroundColor == .gray {
                                takeStep = true
                            }
                        }
                    }
                }
            }
        }
        return takeStep ?? false
    }
    
    @objc func longPressGesture (_ sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .began:
            lightMove(sender)
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut) {
                sender.view?.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }
        case .ended:
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut) {
                sender.view?.transform = .identity
            }
            for view in viewBoard.subviews {
                if view.backgroundColor != .white {
                    view.backgroundColor = .black
                    view.layer.borderWidth = 0
                }
            }
        default: break
        }
    }
    
    @objc func handPanGesture (_ sender: UIPanGestureRecognizer) {
        guard let checker = sender.view, let checkerSquare = checker.superview else { return }
        
        let filterSevenTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 7)}
        let filterNineTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 9)}
        let filterSevenBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 7)}
        let filterNineBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 9)}
        let filterFourteenBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 14)}
        let filterEighteenBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 18)}
        
        switch sender.state {
        case .began:
            viewBoard.bringSubviewToFront(checkerSquare)
        case .changed:
            let translation = sender.translation(in: viewBoard)
            checker.center = CGPoint(x: checker.center.x + translation.x, y: checker.center.y + translation.y)
            sender.setTranslation(.zero, in: viewBoard)
        case .ended:
//  MARK: MOVE WHITE FORWARD
            for view in viewBoard.subviews {
                if view.frame.contains(sender.location(in: viewBoard)) {
                    if checker.backgroundColor == .white, currentPlayerMove == .white,
                       (view.tag == (checkerSquare.tag + 14)) {
                        if view.subviews.isEmpty, view.backgroundColor != .white,  (filterSevenTop.first(where: {$0.subviews.isEmpty}) == nil), filterSevenTop.first?.subviews.first?.backgroundColor == .gray {
                            filterSevenTop.first?.subviews.first?.removeFromSuperview()
                            scoreWhitePlayer += 1
                            whitePleyerScore.text = "\(scoreWhitePlayer)"
                            gameIsFinish()
                            if checker.backgroundColor == .white && view.tag > 55 {
                                checker.backgroundColor = .brown
                            }
                            view.addSubview(checker)
                            checker.center = CGPoint(
                                            x: checkerSquare.frame.height / 2,
                                            y: checkerSquare.frame.height / 2)
                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                    currentPlayerMove = .white
                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                } else {
                                    currentPlayerMove = .gray
                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                }
                            }
                    } else {
                        if checker.backgroundColor == .white, currentPlayerMove == .white,
                           (view.tag == (checkerSquare.tag + 18)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white, (filterNineTop.first(where: {$0.subviews.isEmpty}) == nil), filterNineTop.first?.subviews.first?.backgroundColor == .gray {
                                filterNineTop.first?.subviews.first?.removeFromSuperview()
                                scoreWhitePlayer += 1
                                whitePleyerScore.text = "\(scoreWhitePlayer)"
                                gameIsFinish()
                                if checker.backgroundColor == .white && view.tag > 55 {
                                    checker.backgroundColor = .brown
                                }
                                view.addSubview(checker)
                                checker.center = CGPoint(
                                                x: checkerSquare.frame.height / 2,
                                                y: checkerSquare.frame.height / 2)
                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                    currentPlayerMove = .white
                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                } else {
                                    currentPlayerMove = .gray
                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                }
                            }
                        } else {
                            if checker.backgroundColor == .white, currentPlayerMove == .white,
                                (view.tag == (checkerSquare.tag + 7) || view.tag == (checkerSquare.tag + 9)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white, ((filterFourteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterSevenBottom.first?.subviews.first?.backgroundColor != .gray) || (filterEighteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterSevenBottom.first?.subviews.first?.backgroundColor != .gray)) {
                                            if checker.backgroundColor == .white && view.tag > 55 {
                                                checker.backgroundColor = .brown
                                            }
                                            view.addSubview(checker)
                                            checker.center = CGPoint(
                                                    x: checkerSquare.frame.height / 2,
                                                    y: checkerSquare.frame.height / 2)
                                            currentPlayerMove = .gray
                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                        }
//   MARK: MOVE WHITE BACK
                            } else {
                                if checker.backgroundColor == .white, currentPlayerMove == .white,
                                   (view.tag == (checkerSquare.tag - 14)) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterSevenBottom.first?.subviews.first?.backgroundColor == .gray {
                                        filterSevenBottom.first?.subviews.first?.removeFromSuperview()
                                        scoreWhitePlayer += 1
                                        whitePleyerScore.text = "\(scoreWhitePlayer)"
                                        gameIsFinish()
                                        view.addSubview(checker)
                                        checker.center = CGPoint(
                                                        x: checkerSquare.frame.height / 2,
                                                        y: checkerSquare.frame.height / 2)
                                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                                    currentPlayerMove = .white
                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                } else {
                                                    currentPlayerMove = .gray
                                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                        }
                                    }
                                } else {
                                    if checker.backgroundColor == .white, currentPlayerMove == .white,
                                       (view.tag == (checkerSquare.tag - 18)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterNineBottom.first?.subviews.first?.backgroundColor == .gray  {
                                            filterNineBottom.first?.subviews.first?.removeFromSuperview()
                                            scoreWhitePlayer += 1
                                            whitePleyerScore.text = "\(scoreWhitePlayer)"
                                            gameIsFinish()
                                            view.addSubview(checker)
                                            checker.center = CGPoint(
                                                            x: checkerSquare.frame.height / 2,
                                                            y: checkerSquare.frame.height / 2)
                                                    if moveWhiteChecker(sender, board: viewBoard) == true {
                                                        currentPlayerMove = .white
                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                    } else {
                                                        currentPlayerMove = .gray
                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                            }
                                        }
//  MARK: MOVE GREY FORWARD
                                            } else {
                                                if currentPlayerMove == .gray,
                                                   checker.backgroundColor == .gray, view.tag == (checkerSquare.tag - 18) {
                                                    if view.subviews.isEmpty, view.backgroundColor != .white,  filterNineBottom.first?.subviews.first?.backgroundColor == .white {
                                                        filterNineBottom.first?.subviews.first?.removeFromSuperview()
                                                        scoreGreyPlayer += 1
                                                        greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                        gameIsFinish()
                                                        if checker.backgroundColor == .gray && view.tag < 8 {
                                                            checker.backgroundColor = .magenta
                                                        }
                                                        view.addSubview(checker)
                                                        checker.center = CGPoint(
                                                                        x: checkerSquare.frame.height / 2,
                                                                        y: checkerSquare.frame.height / 2)
                                                                if moveGrayChecker(sender, board: viewBoard) == true {
                                                                    currentPlayerMove = .gray
                                                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                } else {
                                                                    currentPlayerMove = .white
                                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                        }
                                                    }
                                                } else {
                                                    if currentPlayerMove == .gray,
                                                       checker.backgroundColor == .gray, view.tag == (checkerSquare.tag - 14) {
                                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterSevenBottom.first?.subviews.first?.backgroundColor == .white {
                                                            filterSevenBottom.first?.subviews.first?.removeFromSuperview()
                                                            scoreGreyPlayer += 1
                                                            greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                            gameIsFinish()
                                                            if checker.backgroundColor == .gray && view.tag < 8 {
                                                                checker.backgroundColor = .magenta
                                                            }
                                                            view.addSubview(checker)
                                                            checker.center = CGPoint(
                                                                            x: checkerSquare.frame.height / 2,
                                                                            y: checkerSquare.frame.height / 2)
                                                                    if moveGrayChecker(sender, board: viewBoard) == true {
                                                                        currentPlayerMove = .gray
                                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                    } else {
                                                                        currentPlayerMove = .white
                                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                            }
                                                        }
                                                    } else {
                                                        if currentPlayerMove == .gray,
                                                           checker.backgroundColor == .gray,
                                                           (view.tag == (checkerSquare.tag - 7) || view.tag == (checkerSquare.tag - 9)) {
                                                            if view.subviews.isEmpty, view.backgroundColor != .white {
                                                                if checker.backgroundColor == .gray && view.tag < 8 {
                                                                    checker.backgroundColor = .magenta
                                                                }
                                                                view.addSubview(checker)
                                                                checker.center = CGPoint(
                                                                                x: checkerSquare.frame.height / 2,
                                                                                y: checkerSquare.frame.height / 2)
                                                                    currentPlayerMove = .white
                                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                }
//   MARK: MOVE GRAY BACK
                                                    } else {
                                                        if currentPlayerMove == .gray,
                                                           checker.backgroundColor == .gray, view.tag == (checkerSquare.tag + 18) {
                                                            if view.subviews.isEmpty, view.backgroundColor != .white,  filterNineTop.first?.subviews.first?.backgroundColor == .white {
                                                                filterNineTop.first?.subviews.first?.removeFromSuperview()
                                                                scoreGreyPlayer += 1
                                                                greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                                gameIsFinish()
                                                                view.addSubview(checker)
                                                                checker.center = CGPoint(
                                                                                x: checkerSquare.frame.height / 2,
                                                                                y: checkerSquare.frame.height / 2)
                                                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                                                            currentPlayerMove = .gray
                                                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                        } else {
                                                                            currentPlayerMove = .white
                                                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                }
                                                            }
                                                        } else {
                                                            if currentPlayerMove == .gray,
                                                               checker.backgroundColor == .gray, view.tag == (checkerSquare.tag + 14) {
                                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterSevenTop.first?.subviews.first?.backgroundColor == .white {
                                                                    filterSevenTop.first?.subviews.first?.removeFromSuperview()
                                                                    scoreGreyPlayer += 1
                                                                    greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                                    gameIsFinish()
                                                                    view.addSubview(checker)
                                                                    checker.center = CGPoint(
                                                                                    x: checkerSquare.frame.height / 2,
                                                                                    y: checkerSquare.frame.height / 2)
                                                                            if moveGrayChecker(sender, board: viewBoard) == true {
                                                                                currentPlayerMove = .gray
                                                                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                            } else {
                                                                                currentPlayerMove = .white
                                                                                movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                    }
                                                                }
                                                            
                                                            } else {
                                                                checker.center = CGPoint(
                                                                    x: checkerSquare.frame.height / 2,
                                                                    y: checkerSquare.frame.height / 2)
                                                                
                                                            }
                                                        }
                                                    }
                                               }
                                          }
                                       }
                                    }
                                }
                            }
                        }
                    }
                }
            default: break
            }
    }
}
