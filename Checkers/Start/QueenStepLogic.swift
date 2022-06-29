//
//  QueenStepLogic.swift
//  Checkers
//
//  Created by Илья Синицын on 23.06.2022.
//

import UIKit

extension StartGameViewController {
    
    func queenStepsWhite(_ sender: UIPanGestureRecognizer, board: UIView) {
    guard let checker = sender.view, let checkerSquare = checker.superview else {return}
    let sevenTop = board.subviews.filter{($0.tag == checkerSquare.tag + 7)}
    let nineTop = board.subviews.filter{($0.tag == checkerSquare.tag + 9)}
    let fourteenTop = board.subviews.filter{($0.tag == checkerSquare.tag + 14)}
    let eighteenTop = board.subviews.filter{($0.tag == checkerSquare.tag + 18)}
    let twentyOneTop = board.subviews.filter{($0.tag == checkerSquare.tag + 21)}
    let twentySevenTop = board.subviews.filter{($0.tag == checkerSquare.tag + 27)}
    let twentyEightTop = board.subviews.filter{($0.tag == checkerSquare.tag + 28)}
    let thirtyFiveTop = board.subviews.filter{($0.tag == checkerSquare.tag + 35)}
    let thirtySixTop = board.subviews.filter{($0.tag == checkerSquare.tag + 36)}
    let fortyTwoTop = board.subviews.filter{($0.tag == checkerSquare.tag + 42)}
    let fortyFiveTop = board.subviews.filter{($0.tag == checkerSquare.tag + 45)}
    let sevenBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 7)}
    let nineBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 9)}
    let fourteenBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 14)}
    let eighteenBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 18)}
    let twentyOneBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 21)}
    let twentySevenBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 27)}
    let twentyEightBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 28)}
    let thirtyFiveBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 35)}
    let thirtySixBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 36)}
    let fortyTwoBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 42)}
    let fortyFiveBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 45)}
        
//  MARK: Step Red FORWARD
    for view in board.subviews {
        if view.frame.contains(sender.location(in: board)) {
            if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, (view.tag == (checkerSquare.tag - 7) || view.tag == (checkerSquare.tag - 9)) {
                if view.subviews.isEmpty, view.backgroundColor != .white {
                    view.addSubview(checker)
                    checker.center = CGPoint(
                                    x: checkerSquare.frame.height / 2,
                                    y: checkerSquare.frame.height / 2)
                    for view in board.subviews {
                        if view.backgroundColor != .white {
                            view.backgroundColor = .black
                            view.layer.borderWidth = 0
                        }
                    }
//                    currentPlayerMove = .white
//                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                    currentPlayerMove = .gray
                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                    canStepGray(sender, board: board)
                    canStepWhite(sender, board: board)
                    canStepQueenBlue(sender, board: board)
                    canStepQueenRed(sender, board: board)
                }
            } else {
                if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag + 14) {
                    if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first?.subviews.first?.backgroundColor == .gray || sevenTop.first?.subviews.first?.backgroundColor == .blue {
                        sevenTop.first?.subviews.first?.removeFromSuperview()
                        scoreWhitePlayer += 1
                        whitePleyerScore.text = "\(scoreWhitePlayer)"
                        gameIsFinish()
                        view.addSubview(checker)
                        checker.center = CGPoint(
                                        x: checkerSquare.frame.height / 2,
                                        y: checkerSquare.frame.height / 2)
                        for view in board.subviews {
                            if moveWhiteChecker(sender, board: viewBoard) == true {
                                currentPlayerMove = .white
                                movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                            } else {
                                currentPlayerMove = .gray
                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                            }
                            if view.backgroundColor != .white {
                                view.backgroundColor = .black
                                view.layer.borderWidth = 0
                            }
                        }
                        canStepGray(sender, board: board)
                        canStepWhite(sender, board: board)
                        canStepQueenBlue(sender, board: board)
                        canStepQueenRed(sender, board: board)
                } else {
                    if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first(where: {$0.subviews.isEmpty}) != nil {
                       view.addSubview(checker)
                        checker.center = CGPoint(
                                        x: checkerSquare.frame.height / 2,
                                        y: checkerSquare.frame.height / 2)
                        for view in board.subviews {
                            if moveWhiteChecker(sender, board: viewBoard) == true {
                                currentPlayerMove = .white
                                movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                            } else {
                                currentPlayerMove = .gray
                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                            }
                            if view.backgroundColor != .white {
                                view.backgroundColor = .black
                                view.layer.borderWidth = 0
                                }
                            }
                        canStepGray(sender, board: board)
                        canStepWhite(sender, board: board)
                        canStepQueenBlue(sender, board: board)
                        canStepQueenRed(sender, board: board)
                            }
                        }
                    } else {
                        if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty),  checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag + 18) {
                            if view.subviews.isEmpty, view.backgroundColor != .white, nineTop.first?.subviews.first?.backgroundColor == .gray || nineTop.first?.subviews.first?.backgroundColor == .blue  {
                                nineTop.first?.subviews.first?.removeFromSuperview()
                                scoreWhitePlayer += 1
                                whitePleyerScore.text = "\(scoreWhitePlayer)"
                                gameIsFinish()
                                view.addSubview(checker)
                                checker.center = CGPoint(
                                                x: checkerSquare.frame.height / 2,
                                                y: checkerSquare.frame.height / 2)
                                for view in board.subviews {
                                    if view.backgroundColor != .white {
                                        view.backgroundColor = .black
                                        view.layer.borderWidth = 0
                                        if moveWhiteChecker(sender, board: viewBoard) == true {
                                            currentPlayerMove = .white
                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                        } else {
                                            currentPlayerMove = .gray
                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                        }
                                    }
                                }
                                canStepGray(sender, board: board)
                                canStepWhite(sender, board: board)
                                canStepQueenBlue(sender, board: board)
                                canStepQueenRed(sender, board: board)
                            } else {
                                if view.subviews.isEmpty, view.backgroundColor != .white, nineTop.first(where: {$0.subviews.isEmpty}) != nil {
                                    view.addSubview(checker)
                                    checker.center = CGPoint(
                                                    x: checkerSquare.frame.height / 2,
                                                    y: checkerSquare.frame.height / 2)
                                    for view in board.subviews {
                                        if moveWhiteChecker(sender, board: viewBoard) == true {
                                            currentPlayerMove = .white
                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                        } else {
                                            currentPlayerMove = .gray
                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                        }
                                        if view.backgroundColor != .white {
                                            view.backgroundColor = .black
                                            view.layer.borderWidth = 0
                                        }
                                    }
                                    canStepGray(sender, board: board)
                                    canStepWhite(sender, board: board)
                                    canStepQueenBlue(sender, board: board)
                                    canStepQueenRed(sender, board: board)
                                }
                            }
                        } else {
                            if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag + 21) {
                                if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenTop.first?.subviews.first?.backgroundColor == .gray || sevenTop.first?.subviews.first?.backgroundColor == .blue) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .gray || fourteenTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil)  {
                                    sevenTop.first?.subviews.first?.removeFromSuperview()
                                    fourteenTop.first?.subviews.first?.removeFromSuperview()
                                    scoreWhitePlayer += 1
                                    whitePleyerScore.text = "\(scoreWhitePlayer)"
                                    gameIsFinish()
                                    view.addSubview(checker)
                                    checker.center = CGPoint(
                                                    x: checkerSquare.frame.height / 2,
                                                    y: checkerSquare.frame.height / 2)
                                    for view in board.subviews {
                                        if view.backgroundColor != .white {
                                            view.backgroundColor = .black
                                            view.layer.borderWidth = 0
                                            if moveWhiteChecker(sender, board: viewBoard) == true {
                                                currentPlayerMove = .white
                                                movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                            } else {
                                                currentPlayerMove = .gray
                                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                            }
                                        }
                                    }
                                    canStepGray(sender, board: board)
                                    canStepWhite(sender, board: board)
                                    canStepQueenBlue(sender, board: board)
                                    canStepQueenRed(sender, board: board)
                                } else {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                        view.addSubview(checker)
                                        checker.center = CGPoint(
                                                        x: checkerSquare.frame.height / 2,
                                                        y: checkerSquare.frame.height / 2)
                                        for view in board.subviews {
                                            if moveWhiteChecker(sender, board: viewBoard) == true {
                                                currentPlayerMove = .white
                                                movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                            } else {
                                                currentPlayerMove = .gray
                                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                            }
                                            if view.backgroundColor != .white {
                                                view.backgroundColor = .black
                                                view.layer.borderWidth = 0
                                            }
                                        }
                                        canStepGray(sender, board: board)
                                        canStepWhite(sender, board: board)
                                        canStepQueenBlue(sender, board: board)
                                        canStepQueenRed(sender, board: board)
                                    }
                                }
                            } else {
                                if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag + 27) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, ((nineTop.first?.subviews.first?.backgroundColor == .gray || nineTop.first?.subviews.first?.backgroundColor == .blue) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .gray || eighteenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil)  {
                                        nineTop.first?.subviews.first?.removeFromSuperview()
                                        eighteenTop.first?.subviews.first?.removeFromSuperview()
                                        scoreWhitePlayer += 1
                                        whitePleyerScore.text = "\(scoreWhitePlayer)"
                                        gameIsFinish()
                                        view.addSubview(checker)
                                        checker.center = CGPoint(
                                                        x: checkerSquare.frame.height / 2,
                                                        y: checkerSquare.frame.height / 2)
                                        for view in board.subviews {
                                            if view.backgroundColor != .white {
                                                view.backgroundColor = .black
                                                view.layer.borderWidth = 0
                                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                                    currentPlayerMove = .white
                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                } else {
                                                    currentPlayerMove = .gray
                                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                }
                                            }
                                        }
                                        canStepGray(sender, board: board)
                                        canStepWhite(sender, board: board)
                                        canStepQueenBlue(sender, board: board)
                                        canStepQueenRed(sender, board: board)
                                    } else {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                            view.addSubview(checker)
                                            checker.center = CGPoint(
                                                            x: checkerSquare.frame.height / 2,
                                                            y: checkerSquare.frame.height / 2)
                                            for view in board.subviews {
                                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                                    currentPlayerMove = .white
                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                } else {
                                                    currentPlayerMove = .gray
                                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                }
                                                if view.backgroundColor != .white {
                                                    view.backgroundColor = .black
                                                    view.layer.borderWidth = 0
                                                }
                                            }
                                            canStepGray(sender, board: board)
                                            canStepWhite(sender, board: board)
                                            canStepQueenBlue(sender, board: board)
                                            canStepQueenRed(sender, board: board)
                                        }
                                    }
                                } else {
                                    if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag + 36) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, ((nineTop.first?.subviews.first?.backgroundColor == .gray || nineTop.first?.subviews.first?.backgroundColor == .blue) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .gray || eighteenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenTop.first?.subviews.first?.backgroundColor == .gray || twentySevenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                            nineTop.first?.subviews.first?.removeFromSuperview()
                                            eighteenTop.first?.subviews.first?.removeFromSuperview()
                                            twentySevenTop.first?.subviews.first?.removeFromSuperview()
                                            scoreWhitePlayer += 1
                                            whitePleyerScore.text = "\(scoreWhitePlayer)"
                                            gameIsFinish()
                                            view.addSubview(checker)
                                            checker.center = CGPoint(
                                                            x: checkerSquare.frame.height / 2,
                                                            y: checkerSquare.frame.height / 2)
                                            for view in board.subviews {
                                                if view.backgroundColor != .white {
                                                    view.backgroundColor = .black
                                                    view.layer.borderWidth = 0
                                                    if moveWhiteChecker(sender, board: viewBoard) == true {
                                                        currentPlayerMove = .white
                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                    } else {
                                                        currentPlayerMove = .gray
                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                    }
                                                }
                                            }
                                            canStepGray(sender, board: board)
                                            canStepWhite(sender, board: board)
                                            canStepQueenBlue(sender, board: board)
                                            canStepQueenRed(sender, board: board)
                                        } else {
                                            if view.subviews.isEmpty, view.backgroundColor != .white, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                view.addSubview(checker)
                                                checker.center = CGPoint(
                                                                x: checkerSquare.frame.height / 2,
                                                                y: checkerSquare.frame.height / 2)
                                                for view in board.subviews {
                                                    if moveWhiteChecker(sender, board: viewBoard) == true {
                                                        currentPlayerMove = .white
                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                    } else {
                                                        currentPlayerMove = .gray
                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                    }
                                                    if view.backgroundColor != .white {
                                                        view.backgroundColor = .black
                                                        view.layer.borderWidth = 0
                                                    }
                                                }
                                                canStepGray(sender, board: board)
                                                canStepWhite(sender, board: board)
                                                canStepQueenBlue(sender, board: board)
                                                canStepQueenRed(sender, board: board)
                                            }
                                        }
            } else {
                if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag + 45) {
                    if view.subviews.isEmpty, view.backgroundColor != .white, ((nineTop.first?.subviews.first?.backgroundColor == .gray || nineTop.first?.subviews.first?.backgroundColor == .blue) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .gray || eighteenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenTop.first?.subviews.first?.backgroundColor == .gray || twentySevenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixTop.first?.subviews.first?.backgroundColor == .gray || thirtySixTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                        nineTop.first?.subviews.first?.removeFromSuperview()
                        eighteenTop.first?.subviews.first?.removeFromSuperview()
                        twentySevenTop.first?.subviews.first?.removeFromSuperview()
                        thirtySixTop.first?.subviews.first?.removeFromSuperview()
                        scoreWhitePlayer += 1
                        whitePleyerScore.text = "\(scoreWhitePlayer)"
                        gameIsFinish()
                        view.addSubview(checker)
                        checker.center = CGPoint(
                                        x: checkerSquare.frame.height / 2,
                                        y: checkerSquare.frame.height / 2)
                        for view in board.subviews {
                            if view.backgroundColor != .white {
                               view.backgroundColor = .black
                               view.layer.borderWidth = 0
                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                    currentPlayerMove = .white
                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                } else {
                                    currentPlayerMove = .gray
                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                }
                            }
                        }
                        canStepGray(sender, board: board)
                        canStepWhite(sender, board: board)
                        canStepQueenBlue(sender, board: board)
                        canStepQueenRed(sender, board: board)
                } else {
                    if view.subviews.isEmpty, view.backgroundColor != .white, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil {
                        view.addSubview(checker)
                        checker.center = CGPoint(
                                        x: checkerSquare.frame.height / 2,
                                        y: checkerSquare.frame.height / 2)
                            for view in board.subviews {
                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                    currentPlayerMove = .white
                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                } else {
                                    currentPlayerMove = .gray
                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                }
                                if view.backgroundColor != .white {
                                     view.backgroundColor = .black
                                     view.layer.borderWidth = 0
                                }
                          }
                        canStepGray(sender, board: board)
                        canStepWhite(sender, board: board)
                        canStepQueenBlue(sender, board: board)
                        canStepQueenRed(sender, board: board)
                        }
                    }
                    } else {
                       if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty),  checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag + 54) {
                            if view.subviews.isEmpty, view.backgroundColor != .white, ((nineTop.first?.subviews.first?.backgroundColor == .gray || nineTop.first?.subviews.first?.backgroundColor == .blue) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .gray || eighteenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenTop.first?.subviews.first?.backgroundColor == .gray || twentySevenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixTop.first?.subviews.first?.backgroundColor == .gray || thirtySixTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyFiveTop.first?.subviews.first?.backgroundColor == .gray || fortyFiveTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                nineTop.first?.subviews.first?.removeFromSuperview()
                                eighteenTop.first?.subviews.first?.removeFromSuperview()
                                twentySevenTop.first?.subviews.first?.removeFromSuperview()
                                thirtySixTop.first?.subviews.first?.removeFromSuperview()
                                fortyFiveTop.first?.subviews.first?.removeFromSuperview()
                                scoreWhitePlayer += 1
                                whitePleyerScore.text = "\(scoreWhitePlayer)"
                                gameIsFinish()
                                view.addSubview(checker)
                                checker.center = CGPoint(
                                                x: checkerSquare.frame.height / 2,
                                                y: checkerSquare.frame.height / 2)
                                      for view in board.subviews {
                                         if view.backgroundColor != .white {
                                            view.backgroundColor = .black
                                            view.layer.borderWidth = 0
                                            if moveWhiteChecker(sender, board: viewBoard) == true {
                                                 currentPlayerMove = .white
                                                 movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                             } else {
                                                 currentPlayerMove = .gray
                                                 movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                             }
                                            }
                                          }
                                canStepGray(sender, board: board)
                                canStepWhite(sender, board: board)
                                canStepQueenBlue(sender, board: board)
                                canStepQueenRed(sender, board: board)
                                } else {
                                     if view.subviews.isEmpty, view.backgroundColor != .white, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil {
                                         view.addSubview(checker)
                                         checker.center = CGPoint(
                                                         x: checkerSquare.frame.height / 2,
                                                         y: checkerSquare.frame.height / 2)
                                                 for view in board.subviews {
                                                     if moveWhiteChecker(sender, board: viewBoard) == true {
                                                          currentPlayerMove = .white
                                                          movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                      } else {
                                                          currentPlayerMove = .gray
                                                          movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                      }
                                                    if view.backgroundColor != .white {
                                                       view.backgroundColor = .black
                                                       view.layer.borderWidth = 0
                                                    }
                                                }
                                         canStepGray(sender, board: board)
                                         canStepWhite(sender, board: board)
                                         canStepQueenBlue(sender, board: board)
                                         canStepQueenRed(sender, board: board)
                                            }
                                        }
                                    } else {
                                        if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag + 28) {
                                            if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenTop.first?.subviews.first?.backgroundColor == .gray || sevenTop.first?.subviews.first?.backgroundColor == .blue) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .gray || fourteenTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .gray || twentyOneTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                sevenTop.first?.subviews.first?.removeFromSuperview()
                                                fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                scoreWhitePlayer += 1
                                                whitePleyerScore.text = "\(scoreWhitePlayer)"
                                                gameIsFinish()
                                                view.addSubview(checker)
                                                checker.center = CGPoint(
                                                                x: checkerSquare.frame.height / 2,
                                                                y: checkerSquare.frame.height / 2)
                                                for view in board.subviews {
                                                    if view.backgroundColor != .white {
                                                       view.backgroundColor = .black
                                                       view.layer.borderWidth = 0
                                                        if moveWhiteChecker(sender, board: viewBoard) == true {
                                                             currentPlayerMove = .white
                                                             movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                         } else {
                                                             currentPlayerMove = .gray
                                                             movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                         }
                                                    }
                                                }
                                                canStepGray(sender, board: board)
                                                canStepWhite(sender, board: board)
                                                canStepQueenBlue(sender, board: board)
                                                canStepQueenRed(sender, board: board)
                                            } else {
                                                if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                    view.addSubview(checker)
                                                    checker.center = CGPoint(
                                                                    x: checkerSquare.frame.height / 2,
                                                                    y: checkerSquare.frame.height / 2)
                                                    for view in board.subviews {
                                                        if moveWhiteChecker(sender, board: viewBoard) == true {
                                                             currentPlayerMove = .white
                                                             movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                         } else {
                                                             currentPlayerMove = .gray
                                                             movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                         }
                                                        if view.backgroundColor != .white {
                                                            view.backgroundColor = .black
                                                            view.layer.borderWidth = 0
                                                        }
                                                    }
                                                    canStepGray(sender, board: board)
                                                    canStepWhite(sender, board: board)
                                                    canStepQueenBlue(sender, board: board)
                                                    canStepQueenRed(sender, board: board)
                                                }
                                            }
                                    } else {
                                if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag + 35) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenTop.first?.subviews.first?.backgroundColor == .gray || sevenTop.first?.subviews.first?.backgroundColor == .blue) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .gray || fourteenTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .gray || twentyOneTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightTop.first?.subviews.first?.backgroundColor == .gray || twentyEightTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                        sevenTop.first?.subviews.first?.removeFromSuperview()
                                        fourteenTop.first?.subviews.first?.removeFromSuperview()
                                        twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                        twentyEightTop.first?.subviews.first?.removeFromSuperview()
                                        scoreWhitePlayer += 1
                                        whitePleyerScore.text = "\(scoreWhitePlayer)"
                                        gameIsFinish()
                                        view.addSubview(checker)
                                        checker.center = CGPoint(
                                                        x: checkerSquare.frame.height / 2,
                                                        y: checkerSquare.frame.height / 2)
                                        for view in board.subviews {
                                            if view.backgroundColor != .white {
                                                view.backgroundColor = .black
                                                view.layer.borderWidth = 0
                                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                                     currentPlayerMove = .white
                                                     movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                 } else {
                                                     currentPlayerMove = .gray
                                                     movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                 }
                                            }
                                        }
                                        canStepGray(sender, board: board)
                                        canStepWhite(sender, board: board)
                                        canStepQueenBlue(sender, board: board)
                                        canStepQueenRed(sender, board: board)
                                    } else {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil {
                                            view.addSubview(checker)
                                            checker.center = CGPoint(
                                                            x: checkerSquare.frame.height / 2,
                                                            y: checkerSquare.frame.height / 2)
                                            for view in board.subviews {
                                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                                     currentPlayerMove = .white
                                                     movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                 } else {
                                                     currentPlayerMove = .gray
                                                     movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                 }
                                                if view.backgroundColor != .white {
                                                    view.backgroundColor = .black
                                                    view.layer.borderWidth = 0
                                                }
                                            }
                                            canStepGray(sender, board: board)
                                            canStepWhite(sender, board: board)
                                            canStepQueenBlue(sender, board: board)
                                            canStepQueenRed(sender, board: board)
                                        }
                                    }
                                } else {
                                    if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag + 42) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenTop.first?.subviews.first?.backgroundColor == .gray || sevenTop.first?.subviews.first?.backgroundColor == .blue) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .gray || fourteenTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .gray || twentyOneTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightTop.first?.subviews.first?.backgroundColor == .gray || twentyEightTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveTop.first?.subviews.first?.backgroundColor == .gray || thirtyFiveTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                            sevenTop.first?.subviews.first?.removeFromSuperview()
                                            fourteenTop.first?.subviews.first?.removeFromSuperview()
                                            twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                            twentyEightTop.first?.subviews.first?.removeFromSuperview()
                                            thirtyFiveTop.first?.subviews.first?.removeFromSuperview()
                                            scoreWhitePlayer += 1
                                            whitePleyerScore.text = "\(scoreWhitePlayer)"
                                            gameIsFinish()
                                            view.addSubview(checker)
                                            checker.center = CGPoint(
                                                            x: checkerSquare.frame.height / 2,
                                                            y: checkerSquare.frame.height / 2)
                                            for view in board.subviews {
                                                if view.backgroundColor != .white {
                                                    view.backgroundColor = .black
                                                    view.layer.borderWidth = 0
                                                    if moveWhiteChecker(sender, board: viewBoard) == true {
                                                         currentPlayerMove = .white
                                                         movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                     } else {
                                                         currentPlayerMove = .gray
                                                         movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                     }
                                                }
                                            }
                                            canStepGray(sender, board: board)
                                            canStepWhite(sender, board: board)
                                            canStepQueenBlue(sender, board: board)
                                            canStepQueenRed(sender, board: board)
                                        } else {
                                            if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                view.addSubview(checker)
                                                checker.center = CGPoint(
                                                                x: checkerSquare.frame.height / 2,
                                                                y: checkerSquare.frame.height / 2)
                                                for view in board.subviews {
                                                    if moveWhiteChecker(sender, board: viewBoard) == true {
                                                         currentPlayerMove = .white
                                                         movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                     } else {
                                                         currentPlayerMove = .gray
                                                         movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                     }
                                                    if view.backgroundColor != .white {
                                                        view.backgroundColor = .black
                                                        view.layer.borderWidth = 0
                                                    }
                                                }
                                                canStepGray(sender, board: board)
                                                canStepWhite(sender, board: board)
                                                canStepQueenBlue(sender, board: board)
                                                canStepQueenRed(sender, board: board)
                                            }
                                        }
                                    } else {
                                        if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag + 49) {
                                            if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenTop.first?.subviews.first?.backgroundColor == .gray || sevenTop.first?.subviews.first?.backgroundColor == .blue) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .gray || fourteenTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .gray || twentyOneTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightTop.first?.subviews.first?.backgroundColor == .gray || twentyEightTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveTop.first?.subviews.first?.backgroundColor == .gray || thirtyFiveTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyTwoTop.first?.subviews.first?.backgroundColor == .gray || fortyTwoTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                sevenTop.first?.subviews.first?.removeFromSuperview()
                                                fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                twentyEightTop.first?.subviews.first?.removeFromSuperview()
                                                thirtyFiveTop.first?.subviews.first?.removeFromSuperview()
                                                fortyTwoTop.first?.subviews.first?.removeFromSuperview()
                                                scoreWhitePlayer += 1
                                                whitePleyerScore.text = "\(scoreWhitePlayer)"
                                                gameIsFinish()
                                                view.addSubview(checker)
                                                checker.center = CGPoint(
                                                                x: checkerSquare.frame.height / 2,
                                                                y: checkerSquare.frame.height / 2)
                                                for view in board.subviews {
                                                    if view.backgroundColor != .white {
                                                        view.backgroundColor = .black
                                                        view.layer.borderWidth = 0
                                                        if moveWhiteChecker(sender, board: viewBoard) == true {
                                                             currentPlayerMove = .white
                                                             movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                         } else {
                                                             currentPlayerMove = .gray
                                                             movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                         }
                                                    }
                                                }
                                                canStepGray(sender, board: board)
                                                canStepWhite(sender, board: board)
                                                canStepQueenBlue(sender, board: board)
                                                canStepQueenRed(sender, board: board)
                                            } else {
                                                if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                    view.addSubview(checker)
                                                    checker.center = CGPoint(
                                                                    x: checkerSquare.frame.height / 2,
                                                                    y: checkerSquare.frame.height / 2)
                                                    for view in board.subviews {
                                                        if moveWhiteChecker(sender, board: viewBoard) == true {
                                                             currentPlayerMove = .white
                                                             movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                         } else {
                                                             currentPlayerMove = .gray
                                                             movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                         }
                                                        if view.backgroundColor != .white {
                                                            view.backgroundColor = .black
                                                            view.layer.borderWidth = 0
                                                        }
                                                    }
                                                    canStepGray(sender, board: board)
                                                    canStepWhite(sender, board: board)
                                                    canStepQueenBlue(sender, board: board)
                                                    canStepQueenRed(sender, board: board)
                                                }
                                            }
//   MARK: Step Red BACK
                                        } else {
                                            if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag - 14) {
                                                if view.subviews.isEmpty, view.backgroundColor != .white, (sevenBottom.first?.subviews.first?.backgroundColor == .gray || sevenBottom.first?.subviews.first?.backgroundColor == .blue) {
                                                    sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                    scoreWhitePlayer += 1
                                                    whitePleyerScore.text = "\(scoreWhitePlayer)"
                                                    gameIsFinish()
                                                    view.addSubview(checker)
                                                    checker.center = CGPoint(
                                                                    x: checkerSquare.frame.height / 2,
                                                                    y: checkerSquare.frame.height / 2)
                                                    for view in board.subviews {
                                                        if view.backgroundColor != .white {
                                                            view.backgroundColor = .black
                                                            view.layer.borderWidth = 0
                                                            if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                 currentPlayerMove = .white
                                                                 movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                             } else {
                                                                 currentPlayerMove = .gray
                                                                 movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                             }
                                                        }
                                                    }
                                                    canStepGray(sender, board: board)
                                                    canStepWhite(sender, board: board)
                                                    canStepQueenBlue(sender, board: board)
                                                    canStepQueenRed(sender, board: board)
                                                } else {
                                                    if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                        view.addSubview(checker)
                                                        checker.center = CGPoint(
                                                                        x: checkerSquare.frame.height / 2,
                                                                        y: checkerSquare.frame.height / 2)
                                                        for view in board.subviews {
                                                            if view.backgroundColor != .white {
                                                                view.backgroundColor = .black
                                                                view.layer.borderWidth = 0
                                                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                     currentPlayerMove = .white
                                                                     movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                 } else {
                                                                     currentPlayerMove = .gray
                                                                     movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                 }
                                                            }
                                                        }
                                                        canStepGray(sender, board: board)
                                                        canStepWhite(sender, board: board)
                                                        canStepQueenBlue(sender, board: board)
                                                        canStepQueenRed(sender, board: board)
                                                    }
                                                }
                                            } else {
                                                if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag - 18) {
                                                    if view.subviews.isEmpty, view.backgroundColor != .white, nineBottom.first?.subviews.first?.backgroundColor == .gray || nineBottom.first?.subviews.first?.backgroundColor == .blue {
                                                        nineBottom.first?.subviews.first?.removeFromSuperview()
                                                        scoreWhitePlayer += 1
                                                        whitePleyerScore.text = "\(scoreWhitePlayer)"
                                                        gameIsFinish()
                                                        view.addSubview(checker)
                                                        checker.center = CGPoint(
                                                                        x: checkerSquare.frame.height / 2,
                                                                        y: checkerSquare.frame.height / 2)
                                                        for view in board.subviews {
                                                            if view.backgroundColor != .white {
                                                                view.backgroundColor = .black
                                                                view.layer.borderWidth = 0
                                                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                     currentPlayerMove = .white
                                                                     movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                 } else {
                                                                     currentPlayerMove = .gray
                                                                     movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                 }
                                                            }
                                                        }
                                                        canStepGray(sender, board: board)
                                                        canStepWhite(sender, board: board)
                                                        canStepQueenBlue(sender, board: board)
                                                        canStepQueenRed(sender, board: board)
                                                    } else {
                                                        if view.subviews.isEmpty, view.backgroundColor != .white, nineBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                            view.addSubview(checker)
                                                            checker.center = CGPoint(
                                                                        x: checkerSquare.frame.height / 2,
                                                                        y: checkerSquare.frame.height / 2)
                                                            for view in board.subviews {
                                                                if view.backgroundColor != .white {
                                                                    view.backgroundColor = .black
                                                                    view.layer.borderWidth = 0
                                                                    if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                         currentPlayerMove = .white
                                                                         movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                     } else {
                                                                         currentPlayerMove = .gray
                                                                         movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                     }
                                                                }
                                                            }
                                                            canStepGray(sender, board: board)
                                                            canStepWhite(sender, board: board)
                                                            canStepQueenBlue(sender, board: board)
                                                            canStepQueenRed(sender, board: board)
                                                        }
                                                    }
  } else {
       if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag - 21) {
            if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenBottom.first?.subviews.first?.backgroundColor == .gray || sevenBottom.first?.subviews.first?.backgroundColor == .blue) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .gray || fourteenBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil)  {
                sevenBottom.first?.subviews.first?.removeFromSuperview()
                fourteenBottom.first?.subviews.first?.removeFromSuperview()
                scoreWhitePlayer += 1
                whitePleyerScore.text = "\(scoreWhitePlayer)"
                gameIsFinish()
                view.addSubview(checker)
                checker.center = CGPoint(
                            x: checkerSquare.frame.height / 2,
                            y: checkerSquare.frame.height / 2)
                      for view in board.subviews {
                         if view.backgroundColor != .white {
                            view.backgroundColor = .black
                            view.layer.borderWidth = 0
                             if moveWhiteChecker(sender, board: viewBoard) == true {
                                  currentPlayerMove = .white
                                  movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                              } else {
                                  currentPlayerMove = .gray
                                  movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                              }
                            }
                        }
                canStepGray(sender, board: board)
                canStepWhite(sender, board: board)
                canStepQueenBlue(sender, board: board)
                canStepQueenRed(sender, board: board)
                    } else {
                       if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                           view.addSubview(checker)
                           checker.center = CGPoint(
                                       x: checkerSquare.frame.height / 2,
                                       y: checkerSquare.frame.height / 2)
                                  for view in board.subviews {
                                      if moveWhiteChecker(sender, board: viewBoard) == true {
                                           currentPlayerMove = .white
                                           movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                       } else {
                                           currentPlayerMove = .gray
                                           movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                       }
                                      if view.backgroundColor != .white {
                                         view.backgroundColor = .black
                                         view.layer.borderWidth = 0
                                      }
                                }
                           canStepGray(sender, board: board)
                           canStepWhite(sender, board: board)
                           canStepQueenBlue(sender, board: board)
                           canStepQueenRed(sender, board: board)
                        }
                        }
                       } else {
                           if  (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag - 28) {
                               if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenBottom.first?.subviews.first?.backgroundColor == .gray || sevenBottom.first?.subviews.first?.backgroundColor == .blue) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .gray || fourteenBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .gray || twentyOneBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                   scoreWhitePlayer += 1
                                   whitePleyerScore.text = "\(scoreWhitePlayer)"
                                   gameIsFinish()
                                   view.addSubview(checker)
                                   checker.center = CGPoint(
                                               x: checkerSquare.frame.height / 2,
                                               y: checkerSquare.frame.height / 2)
                                                                for view in board.subviews {
                                                                    if view.backgroundColor != .white {
                                                                        view.backgroundColor = .black
                                                                        view.layer.borderWidth = 0
                                                                        if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                             currentPlayerMove = .white
                                                                             movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                         } else {
                                                                             currentPlayerMove = .gray
                                                                             movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                         }
                                                                    }
                                                                }
                                   canStepGray(sender, board: board)
                                   canStepWhite(sender, board: board)
                                   canStepQueenBlue(sender, board: board)
                                   canStepQueenRed(sender, board: board)
                                                            } else {
                                                                if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                    view.addSubview(checker)
                                                                    checker.center = CGPoint(
                                                                                x: checkerSquare.frame.height / 2,
                                                                                y: checkerSquare.frame.height / 2)
                                                                    for view in board.subviews {
                                                                        if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                             currentPlayerMove = .white
                                                                             movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                         } else {
                                                                             currentPlayerMove = .gray
                                                                             movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                         }
                                                                        if view.backgroundColor != .white {
                                                                            view.backgroundColor = .black
                                                                            view.layer.borderWidth = 0
                                                                        }
                                                                    }
                                                                    canStepGray(sender, board: board)
                                                                    canStepWhite(sender, board: board)
                                                                    canStepQueenBlue(sender, board: board)
                                                                    canStepQueenRed(sender, board: board)
                                                                }
                                                            }
                        } else {
                            if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag - 35) {
                                if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenBottom.first?.subviews.first?.backgroundColor == .gray || sevenBottom.first?.subviews.first?.backgroundColor == .blue) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .gray || fourteenBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .gray || twentyOneBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightBottom.first?.subviews.first?.backgroundColor == .gray || twentyEightBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                    sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                    fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                    twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                                    twentyEightBottom.first?.subviews.first?.removeFromSuperview()
                                    scoreWhitePlayer += 1
                                    whitePleyerScore.text = "\(scoreWhitePlayer)"
                                    gameIsFinish()
                                                                    view.addSubview(checker)
                                    checker.center = CGPoint(
                                                x: checkerSquare.frame.height / 2,
                                                y: checkerSquare.frame.height / 2)
                                                                    for view in board.subviews {
                                                                        if view.backgroundColor != .white {
                                                                            view.backgroundColor = .black
                                                                            view.layer.borderWidth = 0
                                                                            if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                                 currentPlayerMove = .white
                                                                                 movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                             } else {
                                                                                 currentPlayerMove = .gray
                                                                                 movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                             }
                                                                        }
                                                                    }
                                    canStepGray(sender, board: board)
                                    canStepWhite(sender, board: board)
                                    canStepQueenBlue(sender, board: board)
                                    canStepQueenRed(sender, board: board)
                                            } else {
                                                if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                    view.addSubview(checker)
                                                    checker.center = CGPoint(
                                                                    x: checkerSquare.frame.height / 2,
                                                                    y: checkerSquare.frame.height / 2)
                                                                        for view in board.subviews {
                                                                            if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                                 currentPlayerMove = .white
                                                                                 movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                             } else {
                                                                                 currentPlayerMove = .gray
                                                                                 movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                             }
                                                                            if view.backgroundColor != .white {
                                                                                view.backgroundColor = .black
                                                                                view.layer.borderWidth = 0
                                                                            }
                                                                        }
                                                                        canStepGray(sender, board: board)
                                                                        canStepWhite(sender, board: board)
                                                                        canStepQueenBlue(sender, board: board)
                                                                        canStepQueenRed(sender, board: board)
                                                                    }
                                                                }
                           } else {
                               if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag - 42) {
                                   if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenBottom.first?.subviews.first?.backgroundColor == .gray || sevenBottom.first?.subviews.first?.backgroundColor == .blue) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .gray || fourteenBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .gray || twentyOneBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightBottom.first?.subviews.first?.backgroundColor == .gray || twentyEightBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveBottom.first?.subviews.first?.backgroundColor == .gray || thirtyFiveBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                        sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                        fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                        twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                                        twentyEightBottom.first?.subviews.first?.removeFromSuperview()
                                                                        thirtyFiveBottom.first?.subviews.first?.removeFromSuperview()
                                       scoreWhitePlayer += 1
                                       whitePleyerScore.text = "\(scoreWhitePlayer)"
                                       gameIsFinish()
                                    view.addSubview(checker)
                                       checker.center = CGPoint(
                                                       x: checkerSquare.frame.height / 2,
                                                       y: checkerSquare.frame.height / 2)
                                                                        for view in board.subviews {
                                                                            if view.backgroundColor != .white {
                                                                                view.backgroundColor = .black
                                                                                view.layer.borderWidth = 0
                                                                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                                     currentPlayerMove = .white
                                                                                     movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                                 } else {
                                                                                     currentPlayerMove = .gray
                                                                                     movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                                 }
                                                                                if view.backgroundColor != .white {
                                                                                    view.backgroundColor = .black
                                                                                    view.layer.borderWidth = 0
                                                                                }
                                                                            }
                                                                        }
                                       canStepGray(sender, board: board)
                                       canStepWhite(sender, board: board)
                                       canStepQueenBlue(sender, board: board)
                                       canStepQueenRed(sender, board: board)
                                    } else {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                            view.addSubview(checker)
                                            checker.center = CGPoint(
                                                                x: checkerSquare.frame.height / 2,
                                                                y: checkerSquare.frame.height / 2)
                                            for view in board.subviews {
                                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                                    currentPlayerMove = .white
                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                } else {
                                                    currentPlayerMove = .gray
                                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                }
                                                if view.backgroundColor != .white {
                                                    view.backgroundColor = .black
                                                    view.layer.borderWidth = 0
                                                                                }
                                                                            }
                                                                            canStepGray(sender, board: board)
                                                                            canStepWhite(sender, board: board)
                                                                            canStepQueenBlue(sender, board: board)
                                                                            canStepQueenRed(sender, board: board)
                                                                        }
                                                                    }
                            } else {
                                if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag - 49) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenBottom.first?.subviews.first?.backgroundColor == .gray || sevenBottom.first?.subviews.first?.backgroundColor == .blue) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .gray || fourteenBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .gray || twentyOneBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightBottom.first?.subviews.first?.backgroundColor == .gray || twentyEightBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveBottom.first?.subviews.first?.backgroundColor == .gray || thirtyFiveBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyTwoBottom.first?.subviews.first?.backgroundColor == .gray || fortyTwoBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                            sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                            fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                            twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                                            twentyEightBottom.first?.subviews.first?.removeFromSuperview()
                                                                            thirtyFiveBottom.first?.subviews.first?.removeFromSuperview()
                                                                            fortyTwoBottom.first?.subviews.first?.removeFromSuperview()
                                        scoreWhitePlayer += 1
                                        whitePleyerScore.text = "\(scoreWhitePlayer)"
                                        gameIsFinish()
                                                                            view.addSubview(checker)
                                        checker.center = CGPoint(
                                                            x: checkerSquare.frame.height / 2,
                                                            y: checkerSquare.frame.height / 2)
                                                                            for view in board.subviews {
                                                                                if view.backgroundColor != .white {
                                                                                    view.backgroundColor = .black
                                                                                    view.layer.borderWidth = 0
                                                                                    if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                                        currentPlayerMove = .white
                                                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                                    } else {
                                                                                        currentPlayerMove = .gray
                                                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                                    }
                                                                                }
                                                                            }
                                        canStepGray(sender, board: board)
                                        canStepWhite(sender, board: board)
                                        canStepQueenBlue(sender, board: board)
                                        canStepQueenRed(sender, board: board)
                                                                        } else {
                                                                            if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                view.addSubview(checker)
                                                                                checker.center = CGPoint(
                                                                                                    x: checkerSquare.frame.height / 2,
                                                                                                    y: checkerSquare.frame.height / 2)
                                                                                for view in board.subviews {
                                                                                    if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                                        currentPlayerMove = .white
                                                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                                    } else {
                                                                                        currentPlayerMove = .gray
                                                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                                    }
                                                                                    if view.backgroundColor != .white {
                                                                                        view.backgroundColor = .black
                                                                                        view.layer.borderWidth = 0
                                                                                    }
                                                                                }
                                                                                canStepGray(sender, board: board)
                                                                                canStepWhite(sender, board: board)
                                                                                canStepQueenBlue(sender, board: board)
                                                                                canStepQueenRed(sender, board: board)
                                                                            }
                                                                        }
                            } else {
                                if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag - 27) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, ((nineBottom.first?.subviews.first?.backgroundColor == .gray || nineBottom.first?.subviews.first?.backgroundColor == .blue) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .gray || eighteenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil)  {
                                                nineBottom.first?.subviews.first?.removeFromSuperview()
                                            eighteenBottom.first?.subviews.first?.removeFromSuperview()
                                            scoreWhitePlayer += 1
                                            whitePleyerScore.text = "\(scoreWhitePlayer)"
                                            gameIsFinish()
                                                                                view.addSubview(checker)
                                            checker.center = CGPoint(
                                                                x: checkerSquare.frame.height / 2,
                                                                y: checkerSquare.frame.height / 2)
                                                                                for view in board.subviews {
                                                                                    if view.backgroundColor != .white {
                                                                                        view.backgroundColor = .black
                                                                                        view.layer.borderWidth = 0
                                                                                        if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                                            currentPlayerMove = .white
                                                                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                                        } else {
                                                                                            currentPlayerMove = .gray
                                                                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                                        }
                                                                                    }
                                                                                }
                                            canStepGray(sender, board: board)
                                            canStepWhite(sender, board: board)
                                            canStepQueenBlue(sender, board: board)
                                            canStepQueenRed(sender, board: board)
                                                                            } else {
                                                                                if view.subviews.isEmpty, view.backgroundColor != .white, nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                    view.addSubview(checker)
                                                                                    checker.center = CGPoint(
                                                                                                        x: checkerSquare.frame.height / 2,
                                                                                                        y: checkerSquare.frame.height / 2)
                                                                                    for view in board.subviews {
                                                                                        if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                                            currentPlayerMove = .white
                                                                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                                        } else {
                                                                                            currentPlayerMove = .gray
                                                                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                                        }
                                                                                        if view.backgroundColor != .white {
                                                                                            view.backgroundColor = .black
                                                                                            view.layer.borderWidth = 0
                                                                                        }
                                                                                    }
                                                                                    canStepGray(sender, board: board)
                                                                                    canStepWhite(sender, board: board)
                                                                                    canStepQueenBlue(sender, board: board)
                                                                                    canStepQueenRed(sender, board: board)
                                                                                }
                                                                            }
                    } else {
                        if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag - 36) {
                            if view.subviews.isEmpty, view.backgroundColor != .white, ((nineBottom.first?.subviews.first?.backgroundColor == .gray || nineBottom.first?.subviews.first?.backgroundColor == .blue) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .gray || eighteenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenBottom.first?.subviews.first?.backgroundColor == .gray || twentySevenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                    nineBottom.first?.subviews.first?.removeFromSuperview()
                                                                                    eighteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                    twentySevenBottom.first?.subviews.first?.removeFromSuperview()
                                scoreWhitePlayer += 1
                                whitePleyerScore.text = "\(scoreWhitePlayer)"
                                gameIsFinish()
                                                                                    view.addSubview(checker)
                                checker.center = CGPoint(
                                                    x: checkerSquare.frame.height / 2,
                                                    y: checkerSquare.frame.height / 2)
                                                                                    for view in board.subviews {
                                                                                        if view.backgroundColor != .white {
                                                                                            view.backgroundColor = .black
                                                                                            view.layer.borderWidth = 0
                                                                                            if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                                                currentPlayerMove = .white
                                                                                                movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                                            } else {
                                                                                                currentPlayerMove = .gray
                                                                                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                                            }
                                                                                        }
                                                                                    }
                                canStepGray(sender, board: board)
                                canStepWhite(sender, board: board)
                                canStepQueenBlue(sender, board: board)
                                canStepQueenRed(sender, board: board)
                    } else {
                        if view.subviews.isEmpty, view.backgroundColor != .white, nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                            view.addSubview(checker)
                            checker.center = CGPoint(
                                                x: checkerSquare.frame.height / 2,
                                                y: checkerSquare.frame.height / 2)
                                                        for view in board.subviews {
                                                            if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                currentPlayerMove = .white
                                                                movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                            } else {
                                                                currentPlayerMove = .gray
                                                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                            }
                                                                                            if view.backgroundColor != .white {
                                                                                                view.backgroundColor = .black
                                                                                                view.layer.borderWidth = 0
                                                                                            }
                                                                                        }
                            canStepGray(sender, board: board)
                            canStepWhite(sender, board: board)
                            canStepQueenBlue(sender, board: board)
                            canStepQueenRed(sender, board: board)
                                                                                    }
                                                                                }
            } else {
                if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag - 45) {
                    if view.subviews.isEmpty, view.backgroundColor != .white, ((nineBottom.first?.subviews.first?.backgroundColor == .gray || nineBottom.first?.subviews.first?.backgroundColor == .blue) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .gray || eighteenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenBottom.first?.subviews.first?.backgroundColor == .gray || twentySevenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixBottom.first?.subviews.first?.backgroundColor == .gray || thirtySixBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                nineBottom.first?.subviews.first?.removeFromSuperview()
                                eighteenBottom.first?.subviews.first?.removeFromSuperview()
                                twentySevenBottom.first?.subviews.first?.removeFromSuperview()
                                thirtySixBottom.first?.subviews.first?.removeFromSuperview()
                        scoreWhitePlayer += 1
                        whitePleyerScore.text = "\(scoreWhitePlayer)"
                        gameIsFinish()
                                                                                view.addSubview(checker)
                        checker.center = CGPoint(
                                            x: checkerSquare.frame.height / 2,
                                            y: checkerSquare.frame.height / 2)
                                                                    for view in board.subviews {
                                                                                            if view.backgroundColor != .white {
                                                                                                view.backgroundColor = .black
                                                                                                view.layer.borderWidth = 0
                                                                                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                                                    currentPlayerMove = .white
                                                                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                                                } else {
                                                                                                    currentPlayerMove = .gray
                                                                                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                                                }
                                                                                            }
                                                                                        }
                        canStepGray(sender, board: board)
                        canStepWhite(sender, board: board)
                        canStepQueenBlue(sender, board: board)
                        canStepQueenRed(sender, board: board)
                                                                                    } else {
                                                                                        if view.subviews.isEmpty, view.backgroundColor != .white, nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                            view.addSubview(checker)
                                                                                            checker.center = CGPoint(
                                                                                                                x: checkerSquare.frame.height / 2,
                                                                                                                y: checkerSquare.frame.height / 2)
                                                                                            for view in board.subviews {
                                                                                                if moveWhiteChecker(sender, board: viewBoard) == true {
                                                                                                    currentPlayerMove = .white
                                                                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                                                } else {
                                                                                                    currentPlayerMove = .gray
                                                                                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                                                }
                                                                                                if view.backgroundColor != .white {
                                                                                                    view.backgroundColor = .black
                                                                                                    view.layer.borderWidth = 0
                                                                                                }
                                                                                            }
                                                                                            canStepGray(sender, board: board)
                                                                                            canStepWhite(sender, board: board)
                                                                                            canStepQueenBlue(sender, board: board)
                                                                                            canStepQueenRed(sender, board: board)
                                                                                        }
                                                                                    }
                } else {
                    if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .white, view.tag == (checkerSquare.tag - 54) {
                        if view.subviews.isEmpty, view.backgroundColor != .white, ((nineBottom.first?.subviews.first?.backgroundColor == .gray || nineBottom.first?.subviews.first?.backgroundColor == .blue) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .gray || eighteenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenBottom.first?.subviews.first?.backgroundColor == .gray || twentySevenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixBottom.first?.subviews.first?.backgroundColor == .gray || thirtySixBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyFiveBottom.first?.subviews.first?.backgroundColor == .gray || fortyFiveBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                nineBottom.first?.subviews.first?.removeFromSuperview()
                                eighteenBottom.first?.subviews.first?.removeFromSuperview()
                                twentySevenBottom.first?.subviews.first?.removeFromSuperview()
                                thirtySixBottom.first?.subviews.first?.removeFromSuperview()
                                fortyFiveBottom.first?.subviews.first?.removeFromSuperview()
                                scoreWhitePlayer += 1
                                whitePleyerScore.text = "\(scoreWhitePlayer)"
                                gameIsFinish()
                                view.addSubview(checker)
                                checker.center = CGPoint(
                                                x: checkerSquare.frame.height / 2,
                                                y: checkerSquare.frame.height / 2)
                                for view in board.subviews {
                                    if view.backgroundColor != .white {
                                        view.backgroundColor = .black
                                        view.layer.borderWidth = 0
                                        if moveWhiteChecker(sender, board: viewBoard) == true {
                                            currentPlayerMove = .white
                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                        } else {
                                            currentPlayerMove = .gray
                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                        }
                                    }
                                }
                                canStepGray(sender, board: board)
                                canStepWhite(sender, board: board)
                                canStepQueenBlue(sender, board: board)
                                canStepQueenRed(sender, board: board)
                            } else {
                                if view.subviews.isEmpty, view.backgroundColor != .white, nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                    view.addSubview(checker)
                                    checker.center = CGPoint(
                                                        x: checkerSquare.frame.height / 2,
                                                        y: checkerSquare.frame.height / 2)
                                    for view in board.subviews {
                                        if moveWhiteChecker(sender, board: viewBoard) == true {
                                            currentPlayerMove = .white
                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                        } else {
                                            currentPlayerMove = .gray
                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                        }
                                        if view.backgroundColor != .white {
                                            view.backgroundColor = .black
                                            view.layer.borderWidth = 0
                                        }
                                    }
                                    canStepGray(sender, board: board)
                                    canStepWhite(sender, board: board)
                                    canStepQueenBlue(sender, board: board)
                                    canStepQueenRed(sender, board: board)
                                }
                            }
//  MARK: Step Blue FORWARD
            } else {
                if arrayOfPossibleStepsQueenBlue.isEmpty, arrayOfPossibleStepsQueenBlue.isEmpty, checker.backgroundColor == .blue, currentPlayerMove == .gray, (view.tag == (checkerSquare.tag + 7) || view.tag == (checkerSquare.tag + 9)) {
                    if view.subviews.isEmpty, view.backgroundColor != .white {
                        view.addSubview(checker)
                        checker.center = CGPoint(
                                            x: checkerSquare.frame.height / 2,
                                            y: checkerSquare.frame.height / 2)
                        for view in board.subviews {
                            if view.backgroundColor != .white {
                                view.backgroundColor = .black
                                view.layer.borderWidth = 0
                            }
                        }
                        currentPlayerMove = .white
                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
//                        currentPlayerMove = .gray
//                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                        canStepGray(sender, board: board)
                        canStepWhite(sender, board: board)
                        canStepQueenBlue(sender, board: board)
                        canStepQueenRed(sender, board: board)
                    }
                } else {
                    if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), currentPlayerMove == .gray, checker.backgroundColor == .blue, view.tag == (checkerSquare.tag - 18) {
                        if view.subviews.isEmpty, view.backgroundColor != .white,  nineBottom.first?.subviews.first?.backgroundColor == .white || nineBottom.first?.subviews.first?.backgroundColor == .red {
                            nineBottom.first?.subviews.first?.removeFromSuperview()
                            scoreGreyPlayer += 1
                            greyPlayerScore.text = "\(scoreGreyPlayer)"
                            gameIsFinish()
                            view.addSubview(checker)
                            checker.center = CGPoint(
                                                x: checkerSquare.frame.height / 2,
                                                y: checkerSquare.frame.height / 2)
                            for view in board.subviews {
                                if view.backgroundColor != .white {
                                    view.backgroundColor = .black
                                    view.layer.borderWidth = 0
                                    if moveGrayChecker(sender, board: viewBoard) == true {
                                        currentPlayerMove = .gray
                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                    } else {
                                        currentPlayerMove = .white
                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                            }
                                }
                                canStepGray(sender, board: board)
                                canStepWhite(sender, board: board)
                                canStepQueenBlue(sender, board: board)
                                canStepQueenRed(sender, board: board)
                            }
                        } else {
                            if view.subviews.isEmpty, view.backgroundColor != .white,  nineBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                view.addSubview(checker)
                                checker.center = CGPoint(
                                                    x: checkerSquare.frame.height / 2,
                                                    y: checkerSquare.frame.height / 2)
                                for view in board.subviews {
                                    if view.backgroundColor != .white {
                                        view.backgroundColor = .black
                                            view.layer.borderWidth = 0
                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                            currentPlayerMove = .gray
                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                        } else {
                                            currentPlayerMove = .white
                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                        }
                                    }
                                    canStepGray(sender, board: board)
                                    canStepWhite(sender, board: board)
                                    canStepQueenBlue(sender, board: board)
                                    canStepQueenRed(sender, board: board)
                                }
                            }
                        }
                    } else {
                        if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), currentPlayerMove == .gray, checker.backgroundColor == .blue, view.tag == (checkerSquare.tag - 14) {
                            if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red {
                                sevenBottom.first?.subviews.first?.removeFromSuperview()
                                scoreGreyPlayer += 1
                                greyPlayerScore.text = "\(scoreGreyPlayer)"
                                gameIsFinish()
                                view.addSubview(checker)
                                checker.center = CGPoint(
                                                    x: checkerSquare.frame.height / 2,
                                                    y: checkerSquare.frame.height / 2)
                                for view in board.subviews {
                                    if view.backgroundColor != .white {
                                        view.backgroundColor = .black
                                        view.layer.borderWidth = 0
                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                            currentPlayerMove = .gray
                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                        } else {
                                            currentPlayerMove = .white
                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                        }
                                    }
                                    canStepGray(sender, board: board)
                                    canStepWhite(sender, board: board)
                                    canStepQueenBlue(sender, board: board)
                                    canStepQueenRed(sender, board: board)
                                }
                            } else {
                                if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                    view.addSubview(checker)
                                    checker.center = CGPoint(
                                                        x: checkerSquare.frame.height / 2,
                                                        y: checkerSquare.frame.height / 2)
                                    for view in board.subviews {
                                        if view.backgroundColor != .white {
                                            view.backgroundColor = .black
                                            view.layer.borderWidth = 0
                                            if moveGrayChecker(sender, board: viewBoard) == true {
                                                currentPlayerMove = .gray
                                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                            } else {
                                                currentPlayerMove = .white
                                                movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                            }
                                        }
                                        canStepGray(sender, board: board)
                                        canStepWhite(sender, board: board)
                                        canStepQueenBlue(sender, board: board)
                                        canStepQueenRed(sender, board: board)
                                                    }
                                                }
                                            }
                                        } else {
                                            if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty),
                                               currentPlayerMove == .gray, checker.backgroundColor == .blue, view.tag == (checkerSquare.tag + 18) {
                                                if view.subviews.isEmpty, view.backgroundColor != .white,  nineTop.first?.subviews.first?.backgroundColor == .white || nineTop.first?.subviews.first?.backgroundColor == .red {
                                                    nineTop.first?.subviews.first?.removeFromSuperview()
                                                    scoreGreyPlayer += 1
                                                    greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                    gameIsFinish()
                                                    view.addSubview(checker)
                                                    checker.center = CGPoint(
                                                                        x: checkerSquare.frame.height / 2,
                                                                        y: checkerSquare.frame.height / 2)
                                                    for view in board.subviews {
                                                        if view.backgroundColor != .white {
                                                            view.backgroundColor = .black
                                                            view.layer.borderWidth = 0
                                                            if moveGrayChecker(sender, board: viewBoard) == true {
                                                                currentPlayerMove = .gray
                                                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                            } else {
                                                                currentPlayerMove = .white
                                                                movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                            }
                                                        }
                                                        canStepGray(sender, board: board)
                                                        canStepWhite(sender, board: board)
                                                        canStepQueenBlue(sender, board: board)
                                                        canStepQueenRed(sender, board: board)
                                                    }
                                                } else {
                                                    if view.subviews.isEmpty, view.backgroundColor != .white,  nineTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                        view.addSubview(checker)
                                                        checker.center = CGPoint(
                                                                            x: checkerSquare.frame.height / 2,
                                                                            y: checkerSquare.frame.height / 2)
                                                        for view in board.subviews {
                                                            if view.backgroundColor != .white {
                                                                view.backgroundColor = .black
                                                                view.layer.borderWidth = 0
                                                                if moveGrayChecker(sender, board: viewBoard) == true {
                                                                    currentPlayerMove = .gray
                                                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                } else {
                                                                    currentPlayerMove = .white
                                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                }
                                                            }
                                                            canStepGray(sender, board: board)
                                                            canStepWhite(sender, board: board)
                                                            canStepQueenBlue(sender, board: board)
                                                            canStepQueenRed(sender, board: board)
                                                        }
                                                    }
                                                }
                                            } else {
                                                if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag + 21) {
                                                    if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenTop.first?.subviews.first?.backgroundColor == .white || sevenTop.first?.subviews.first?.backgroundColor == .red) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .white || fourteenTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil)  {
                                                        sevenTop.first?.subviews.first?.removeFromSuperview()
                                                        fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                        scoreGreyPlayer += 1
                                                        greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                        gameIsFinish()
                                                        view.addSubview(checker)
                                                        checker.center = CGPoint(
                                                                            x: checkerSquare.frame.height / 2,
                                                                            y: checkerSquare.frame.height / 2)
                                                        for view in board.subviews {
                                                            if view.backgroundColor != .white {
                                                                view.backgroundColor = .black
                                                                view.layer.borderWidth = 0
                                                                if moveGrayChecker(sender, board: viewBoard) == true {
                                                                    currentPlayerMove = .gray
                                                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                } else {
                                                                    currentPlayerMove = .white
                                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                }
                                                            }
                                                        }
                                                        canStepGray(sender, board: board)
                                                        canStepWhite(sender, board: board)
                                                        canStepQueenBlue(sender, board: board)
                                                        canStepQueenRed(sender, board: board)
                                                    } else {
                                                        if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                            view.addSubview(checker)
                                                            checker.center = CGPoint(
                                                                                x: checkerSquare.frame.height / 2,
                                                                                y: checkerSquare.frame.height / 2)
                                                            for view in board.subviews {
                                                                if moveGrayChecker(sender, board: viewBoard) == true {
                                                                    currentPlayerMove = .gray
                                                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                } else {
                                                                    currentPlayerMove = .white
                                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                }
                                                                if view.backgroundColor != .white {
                                                                    view.backgroundColor = .black
                                                                    view.layer.borderWidth = 0
                                                                }
                                                            }
                                                            canStepGray(sender, board: board)
                                                            canStepWhite(sender, board: board)
                                                            canStepQueenBlue(sender, board: board)
                                                            canStepQueenRed(sender, board: board)
                                                        }
                                                    }
                                                } else {
                                                    if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag + 27) {
                                                        if view.subviews.isEmpty, view.backgroundColor != .white, ((nineTop.first?.subviews.first?.backgroundColor == .white || nineTop.first?.subviews.first?.backgroundColor == .red) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .white || eighteenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil)  {
                                                            nineTop.first?.subviews.first?.removeFromSuperview()
                                                            eighteenTop.first?.subviews.first?.removeFromSuperview()
                                                            scoreGreyPlayer += 1
                                                            greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                            gameIsFinish()
                                                            view.addSubview(checker)
                                                            checker.center = CGPoint(
                                                                                x: checkerSquare.frame.height / 2,
                                                                                y: checkerSquare.frame.height / 2)
                                                            for view in board.subviews {
                                                                if view.backgroundColor != .white {
                                                                    view.backgroundColor = .black
                                                                    view.layer.borderWidth = 0
                                                                    if moveGrayChecker(sender, board: viewBoard) == true {
                                                                        currentPlayerMove = .gray
                                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                    } else {
                                                                        currentPlayerMove = .white
                                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                    }
                                                                }
                                                            }
                                                            canStepGray(sender, board: board)
                                                            canStepWhite(sender, board: board)
                                                            canStepQueenBlue(sender, board: board)
                                                            canStepQueenRed(sender, board: board)
                                                        } else {
                                                            if view.subviews.isEmpty, view.backgroundColor != .white, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                view.addSubview(checker)
                                                                checker.center = CGPoint(
                                                                                    x: checkerSquare.frame.height / 2,
                                                                                    y: checkerSquare.frame.height / 2)
                                                                for view in board.subviews {
                                                                    if moveGrayChecker(sender, board: viewBoard) == true {
                                                                        currentPlayerMove = .gray
                                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                    } else {
                                                                        currentPlayerMove = .white
                                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                    }
                                                                    if view.backgroundColor != .white {
                                                                        view.backgroundColor = .black
                                                                        view.layer.borderWidth = 0
                                                                    }
                                                                }
                                                                canStepGray(sender, board: board)
                                                                canStepWhite(sender, board: board)
                                                                canStepQueenBlue(sender, board: board)
                                                                canStepQueenRed(sender, board: board)
                                                            }
                                                        }
                                                    } else {
                                                        if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag + 36) {
                                                            if view.subviews.isEmpty, view.backgroundColor != .white, ((nineTop.first?.subviews.first?.backgroundColor == .white || nineTop.first?.subviews.first?.backgroundColor == .red) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .white || eighteenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenTop.first?.subviews.first?.backgroundColor == .white || twentySevenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                nineTop.first?.subviews.first?.removeFromSuperview()
                                                                eighteenTop.first?.subviews.first?.removeFromSuperview()
                                                                twentySevenTop.first?.subviews.first?.removeFromSuperview()
                                                                scoreGreyPlayer += 1
                                                                greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                                gameIsFinish()
                                                                view.addSubview(checker)
                                                                checker.center = CGPoint(
                                                                                    x: checkerSquare.frame.height / 2,
                                                                                    y: checkerSquare.frame.height / 2)
                                                                for view in board.subviews {
                                                                    if view.backgroundColor != .white {
                                                                        view.backgroundColor = .black
                                                                        view.layer.borderWidth = 0
                                                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                                                            currentPlayerMove = .gray
                                                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                        } else {
                                                                            currentPlayerMove = .white
                                                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                        }
                                                                    }
                                                                }
                                                                canStepGray(sender, board: board)
                                                                canStepWhite(sender, board: board)
                                                                canStepQueenBlue(sender, board: board)
                                                                canStepQueenRed(sender, board: board)
                                                            } else {
                                                                if view.subviews.isEmpty, view.backgroundColor != .white, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                    view.addSubview(checker)
                                                                    checker.center = CGPoint(
                                                                                        x: checkerSquare.frame.height / 2,
                                                                                        y: checkerSquare.frame.height / 2)
                                                                    for view in board.subviews {
                                                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                                                            currentPlayerMove = .gray
                                                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                        } else {
                                                                            currentPlayerMove = .white
                                                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                        }
                                                                        if view.backgroundColor != .white {
                                                                            view.backgroundColor = .black
                                                                            view.layer.borderWidth = 0
                                                                        }
                                                                    }
                                                                    canStepGray(sender, board: board)
                                                                    canStepWhite(sender, board: board)
                                                                    canStepQueenBlue(sender, board: board)
                                                                    canStepQueenRed(sender, board: board)
                                                                }
                                                            }
                                } else {
                                    if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag + 45) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, ((nineTop.first?.subviews.first?.backgroundColor == .white || nineTop.first?.subviews.first?.backgroundColor == .red) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .white || eighteenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenTop.first?.subviews.first?.backgroundColor == .white || twentySevenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixTop.first?.subviews.first?.backgroundColor == .white || thirtySixTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                            nineTop.first?.subviews.first?.removeFromSuperview()
                                            eighteenTop.first?.subviews.first?.removeFromSuperview()
                                            twentySevenTop.first?.subviews.first?.removeFromSuperview()
                                            thirtySixTop.first?.subviews.first?.removeFromSuperview()
                                            scoreGreyPlayer += 1
                                            greyPlayerScore.text = "\(scoreGreyPlayer)"
                                            gameIsFinish()
                                            view.addSubview(checker)
                                            checker.center = CGPoint(
                                                                x: checkerSquare.frame.height / 2,
                                                                y: checkerSquare.frame.height / 2)
                                            for view in board.subviews {
                                                if view.backgroundColor != .white {
                                                   view.backgroundColor = .black
                                                   view.layer.borderWidth = 0
                                                    if moveGrayChecker(sender, board: viewBoard) == true {
                                                        currentPlayerMove = .gray
                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                    } else {
                                                        currentPlayerMove = .white
                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                    }
                                                }
                                            }
                                            canStepGray(sender, board: board)
                                            canStepWhite(sender, board: board)
                                            canStepQueenBlue(sender, board: board)
                                            canStepQueenRed(sender, board: board)
                                    } else {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil {
                                            view.addSubview(checker)
                                            checker.center = CGPoint(
                                                                x: checkerSquare.frame.height / 2,
                                                                y: checkerSquare.frame.height / 2)
                                                for view in board.subviews {
                                                    if moveGrayChecker(sender, board: viewBoard) == true {
                                                        currentPlayerMove = .gray
                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                    } else {
                                                        currentPlayerMove = .white
                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                    }
                                                      if view.backgroundColor != .white {
                                                         view.backgroundColor = .black
                                                         view.layer.borderWidth = 0
                                                   }
                                              }
                                             canStepGray(sender, board: board)
                                             canStepWhite(sender, board: board)
                                             canStepQueenBlue(sender, board: board)
                                             canStepQueenRed(sender, board: board)
                                        }
                                    }
                                } else {
                                           if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty),  checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag + 54) {
                                                if view.subviews.isEmpty, view.backgroundColor != .white, ((nineTop.first?.subviews.first?.backgroundColor == .white || nineTop.first?.subviews.first?.backgroundColor == .red) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .white || eighteenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenTop.first?.subviews.first?.backgroundColor == .white || twentySevenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixTop.first?.subviews.first?.backgroundColor == .white || thirtySixTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyFiveTop.first?.subviews.first?.backgroundColor == .white || fortyFiveTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                    nineTop.first?.subviews.first?.removeFromSuperview()
                                                    eighteenTop.first?.subviews.first?.removeFromSuperview()
                                                    twentySevenTop.first?.subviews.first?.removeFromSuperview()
                                                    thirtySixTop.first?.subviews.first?.removeFromSuperview()
                                                    fortyFiveTop.first?.subviews.first?.removeFromSuperview()
                                                    scoreGreyPlayer += 1
                                                    greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                    gameIsFinish()
                                                    view.addSubview(checker)
                                                    checker.center = CGPoint(
                                                                        x: checkerSquare.frame.height / 2,
                                                                        y: checkerSquare.frame.height / 2)
                                                          for view in board.subviews {
                                                             if view.backgroundColor != .white {
                                                                view.backgroundColor = .black
                                                                view.layer.borderWidth = 0
                                                                 if moveGrayChecker(sender, board: viewBoard) == true {
                                                                     currentPlayerMove = .gray
                                                                     movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                 } else {
                                                                     currentPlayerMove = .white
                                                                     movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                         }
                                                                  }
                                                              }
                                                    canStepGray(sender, board: board)
                                                    canStepWhite(sender, board: board)
                                                    canStepQueenBlue(sender, board: board)
                                                    canStepQueenRed(sender, board: board)
                                                    } else {
                                                         if view.subviews.isEmpty, view.backgroundColor != .white, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                             view.addSubview(checker)
                                                             checker.center = CGPoint(
                                                                                 x: checkerSquare.frame.height / 2,
                                                                                 y: checkerSquare.frame.height / 2)
                                                                     for view in board.subviews {
                                                                         if moveGrayChecker(sender, board: viewBoard) == true {
                                                                             currentPlayerMove = .gray
                                                                             movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                         } else {
                                                                             currentPlayerMove = .white
                                                                             movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                 }
                                                                        if view.backgroundColor != .white {
                                                                           view.backgroundColor = .black
                                                                           view.layer.borderWidth = 0
                                                                        }
                                                                    }
                                                             canStepGray(sender, board: board)
                                                             canStepWhite(sender, board: board)
                                                             canStepQueenBlue(sender, board: board)
                                                             canStepQueenRed(sender, board: board)
                                                                }
                                                            }
                                                        } else {
                                                            if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag + 28) {
                                                                if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenTop.first?.subviews.first?.backgroundColor == .white || sevenTop.first?.subviews.first?.backgroundColor == .red) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .white || fourteenTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .white || twentyOneTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                    sevenTop.first?.subviews.first?.removeFromSuperview()
                                                                    fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                                    twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                                    scoreGreyPlayer += 1
                                                                    greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                                    gameIsFinish()
                                                                    view.addSubview(checker)
                                                                    checker.center = CGPoint(
                                                                                        x: checkerSquare.frame.height / 2,
                                                                                        y: checkerSquare.frame.height / 2)
                                                                    for view in board.subviews {
                                                                        if view.backgroundColor != .white {
                                                                           view.backgroundColor = .black
                                                                           view.layer.borderWidth = 0
                                                                            if moveGrayChecker(sender, board: viewBoard) == true {
                                                                                currentPlayerMove = .gray
                                                                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                            } else {
                                                                                currentPlayerMove = .white
                                                                                movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                    }
                                                                        }
                                                                    }
                                                                    canStepGray(sender, board: board)
                                                                    canStepWhite(sender, board: board)
                                                                    canStepQueenBlue(sender, board: board)
                                                                    canStepQueenRed(sender, board: board)
                                                                } else {
                                                                    if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                        view.addSubview(checker)
                                                                        checker.center = CGPoint(
                                                                                            x: checkerSquare.frame.height / 2,
                                                                                            y: checkerSquare.frame.height / 2)
                                                                        for view in board.subviews {
                                                                            if moveGrayChecker(sender, board: viewBoard) == true {
                                                                                currentPlayerMove = .gray
                                                                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                            } else {
                                                                                currentPlayerMove = .white
                                                                                movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                    }
                                                                        }
                                                                        canStepGray(sender, board: board)
                                                                        canStepWhite(sender, board: board)
                                                                        canStepQueenBlue(sender, board: board)
                                                                        canStepQueenRed(sender, board: board)
                                                                    }
                                                                }
                                                        } else {
                                                    if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag + 35) {
                                                        if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenTop.first?.subviews.first?.backgroundColor == .white || sevenTop.first?.subviews.first?.backgroundColor == .red) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .white || fourteenTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .white || twentyOneTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightTop.first?.subviews.first?.backgroundColor == .white || twentyEightTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                            sevenTop.first?.subviews.first?.removeFromSuperview()
                                                            fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                            twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                            twentyEightTop.first?.subviews.first?.removeFromSuperview()
                                                            scoreGreyPlayer += 1
                                                            greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                            gameIsFinish()
                                                            view.addSubview(checker)
                                                            checker.center = CGPoint(
                                                                                x: checkerSquare.frame.height / 2,
                                                                                y: checkerSquare.frame.height / 2)
                                                            for view in board.subviews {
                                                                if view.backgroundColor != .white {
                                                                    view.backgroundColor = .black
                                                                    view.layer.borderWidth = 0
                                                                    if moveGrayChecker(sender, board: viewBoard) == true {
                                                                        currentPlayerMove = .gray
                                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                    } else {
                                                                        currentPlayerMove = .white
                                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                    }
                                                                }
                                                            }
                                                            canStepGray(sender, board: board)
                                                            canStepWhite(sender, board: board)
                                                            canStepQueenBlue(sender, board: board)
                                                            canStepQueenRed(sender, board: board)
                                                        } else {
                                                            if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                view.addSubview(checker)
                                                                checker.center = CGPoint(
                                                                                    x: checkerSquare.frame.height / 2,
                                                                                    y: checkerSquare.frame.height / 2)
                                                                for view in board.subviews {
                                                                    if moveGrayChecker(sender, board: viewBoard) == true {
                                                                        currentPlayerMove = .gray
                                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                    } else {
                                                                        currentPlayerMove = .white
                                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                    }
                                                                    if view.backgroundColor != .white {
                                                                        view.backgroundColor = .black
                                                                        view.layer.borderWidth = 0
                                                                    }
                                                                }
                                                                canStepGray(sender, board: board)
                                                                canStepWhite(sender, board: board)
                                                                canStepQueenBlue(sender, board: board)
                                                                canStepQueenRed(sender, board: board)
                                                            }
                                                        }
                                                    } else {
                                                        if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag + 42) {
                                                            if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenTop.first?.subviews.first?.backgroundColor == .white || sevenTop.first?.subviews.first?.backgroundColor == .red) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .white || fourteenTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .white || twentyOneTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightTop.first?.subviews.first?.backgroundColor == .white || twentyEightTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveTop.first?.subviews.first?.backgroundColor == .white || thirtyFiveTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                sevenTop.first?.subviews.first?.removeFromSuperview()
                                                                fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                                twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                                twentyEightTop.first?.subviews.first?.removeFromSuperview()
                                                                thirtyFiveTop.first?.subviews.first?.removeFromSuperview()
                                                                scoreGreyPlayer += 1
                                                                greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                                gameIsFinish()
                                                                view.addSubview(checker)
                                                                checker.center = CGPoint(
                                                                                    x: checkerSquare.frame.height / 2,
                                                                                    y: checkerSquare.frame.height / 2)
                                                                for view in board.subviews {
                                                                    if view.backgroundColor != .white {
                                                                        view.backgroundColor = .black
                                                                        view.layer.borderWidth = 0
                                                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                                                            currentPlayerMove = .gray
                                                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                        } else {
                                                                            currentPlayerMove = .white
                                                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                        }
                                                                    }
                                                                }
                                                                canStepGray(sender, board: board)
                                                                canStepWhite(sender, board: board)
                                                                canStepQueenBlue(sender, board: board)
                                                                canStepQueenRed(sender, board: board)
                                                            } else {
                                                                if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                    view.addSubview(checker)
                                                                    checker.center = CGPoint(
                                                                                        x: checkerSquare.frame.height / 2,
                                                                                        y: checkerSquare.frame.height / 2)
                                                                    for view in board.subviews {
                                                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                                                            currentPlayerMove = .gray
                                                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                        } else {
                                                                            currentPlayerMove = .white
                                                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                        }
                                                                        if view.backgroundColor != .white {
                                                                            view.backgroundColor = .black
                                                                            view.layer.borderWidth = 0
                                                                        }
                                                                    }
                                                                    canStepGray(sender, board: board)
                                                                    canStepWhite(sender, board: board)
                                                                    canStepQueenBlue(sender, board: board)
                                                                    canStepQueenRed(sender, board: board)
                                                                }
                                                            }
                                                        } else {
                                                            if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag + 49) {
                                                                if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenTop.first?.subviews.first?.backgroundColor == .white || sevenTop.first?.subviews.first?.backgroundColor == .red) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .white || fourteenTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .white || twentyOneTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightTop.first?.subviews.first?.backgroundColor == .white || twentyEightTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveTop.first?.subviews.first?.backgroundColor == .white || thirtyFiveTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyTwoTop.first?.subviews.first?.backgroundColor == .white || fortyTwoTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                    sevenTop.first?.subviews.first?.removeFromSuperview()
                                                                    fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                                    twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                                    twentyEightTop.first?.subviews.first?.removeFromSuperview()
                                                                    thirtyFiveTop.first?.subviews.first?.removeFromSuperview()
                                                                    fortyTwoTop.first?.subviews.first?.removeFromSuperview()
                                                                    scoreGreyPlayer += 1
                                                                    greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                                    gameIsFinish()
                                                                    view.addSubview(checker)
                                                                    checker.center = CGPoint(
                                                                                        x: checkerSquare.frame.height / 2,
                                                                                        y: checkerSquare.frame.height / 2)
                                                                    for view in board.subviews {
                                                                        if view.backgroundColor != .white {
                                                                            view.backgroundColor = .black
                                                                            view.layer.borderWidth = 0
                                                                            if moveGrayChecker(sender, board: viewBoard) == true {
                                                                                currentPlayerMove = .gray
                                                                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                            } else {
                                                                                currentPlayerMove = .white
                                                                                movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                            }
                                                                        }
                                                                    }
                                                                    canStepGray(sender, board: board)
                                                                    canStepWhite(sender, board: board)
                                                                    canStepQueenBlue(sender, board: board)
                                                                    canStepQueenRed(sender, board: board)
                                            } else {
                                                if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                    view.addSubview(checker)
                                                    checker.center = CGPoint(
                                                                        x: checkerSquare.frame.height / 2,
                                                                        y: checkerSquare.frame.height / 2)
                                                        for view in board.subviews {
                                                            if moveGrayChecker(sender, board: viewBoard) == true {
                                                            currentPlayerMove = .gray
                                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                        } else {
                                                            currentPlayerMove = .white
                                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                        }
                                                }
                                            }
                            }
//   MARK: Step Blue BACK
                        } else {
                            if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag - 14) {
                                if view.subviews.isEmpty, view.backgroundColor != .white, (sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red) {
                                    sevenBottom.first?.subviews.first?.removeFromSuperview()
                                    scoreGreyPlayer += 1
                                    greyPlayerScore.text = "\(scoreGreyPlayer)"
                                    gameIsFinish()
                                    view.addSubview(checker)
                                    checker.center = CGPoint(
                                                        x: checkerSquare.frame.height / 2,
                                                        y: checkerSquare.frame.height / 2)
                                                                        for view in board.subviews {
                                                                            if view.backgroundColor != .white {
                                                                                view.backgroundColor = .black
                                                                                view.layer.borderWidth = 0
                                                                                if moveGrayChecker(sender, board: viewBoard) == true {
                                                                                    currentPlayerMove = .gray
                                                                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                                } else {
                                                                                    currentPlayerMove = .white
                                                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                                }
                                                                            }
                                                                        }
                                                                        canStepGray(sender, board: board)
                                                                        canStepWhite(sender, board: board)
                                                                        canStepQueenBlue(sender, board: board)
                                                                        canStepQueenRed(sender, board: board)
                                                                    } else {
                                                                        if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                            view.addSubview(checker)
                                                                            checker.center = CGPoint(
                                                                                                x: checkerSquare.frame.height / 2,
                                                                                                y: checkerSquare.frame.height / 2)
                                                                            for view in board.subviews {
                                                                                if view.backgroundColor != .white {
                                                                                    view.backgroundColor = .black
                                                                                    view.layer.borderWidth = 0
                                                                                    if moveGrayChecker(sender, board: viewBoard) == true {
                                                                                        currentPlayerMove = .gray
                                                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                                    } else {
                                                                                        currentPlayerMove = .white
                                                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                                    }
                                                                                }
                                                                            }
                                                                            canStepGray(sender, board: board)
                                                                            canStepWhite(sender, board: board)
                                                                            canStepQueenBlue(sender, board: board)
                                                                            canStepQueenRed(sender, board: board)
                                                                        }
                                                                    }
                } else {
                    if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag - 18) {
                        if view.subviews.isEmpty, view.backgroundColor != .white, nineBottom.first?.subviews.first?.backgroundColor == .gray || nineBottom.first?.subviews.first?.backgroundColor == .blue {
                            nineBottom.first?.subviews.first?.removeFromSuperview()
                            scoreGreyPlayer += 1
                            greyPlayerScore.text = "\(scoreGreyPlayer)"
                            gameIsFinish()
                            view.addSubview(checker)
                            checker.center = CGPoint(
                                                x: checkerSquare.frame.height / 2,
                                                y: checkerSquare.frame.height / 2)
                                                                            for view in board.subviews {
                                                                                if view.backgroundColor != .white {
                                                                                    view.backgroundColor = .black
                                                                                    view.layer.borderWidth = 0
                                                                                    if moveGrayChecker(sender, board: viewBoard) == true {
                                                                                        currentPlayerMove = .gray
                                                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                                    } else {
                                                                                        currentPlayerMove = .white
                                                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                                    }
                                                                                }
                                                                            }
                                                                            canStepGray(sender, board: board)
                                                                            canStepWhite(sender, board: board)
                                                                            canStepQueenBlue(sender, board: board)
                                                                            canStepQueenRed(sender, board: board)
                                                                        } else {
                                                                            if view.subviews.isEmpty, view.backgroundColor != .white, nineBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                view.addSubview(checker)
                                                                                checker.center = CGPoint(
                                                                                                    x: checkerSquare.frame.height / 2,
                                                                                                    y: checkerSquare.frame.height / 2)
                                                                                for view in board.subviews {
                                                                                    if view.backgroundColor != .white {
                                                                                        view.backgroundColor = .black
                                                                                        view.layer.borderWidth = 0
                                                                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                                                                            currentPlayerMove = .gray
                                                                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                                                        } else {
                                                                                            currentPlayerMove = .white
                                                                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                                        }
                                                                                    }
                                                                                }
                                                                                canStepGray(sender, board: board)
                                                                                canStepWhite(sender, board: board)
                                                                                canStepQueenBlue(sender, board: board)
                                                                                canStepQueenRed(sender, board: board)
                                                                            }
                                                                        }
                      } else {
                           if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag - 21) {
                                if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .white || fourteenBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                    sevenBottom.first?.subviews.first?.removeFromSuperview()
                                    fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                    scoreGreyPlayer += 1
                                    greyPlayerScore.text = "\(scoreGreyPlayer)"
                                    gameIsFinish()
                                    view.addSubview(checker)
                                    checker.center = CGPoint(
                                                        x: checkerSquare.frame.height / 2,
                                                        y: checkerSquare.frame.height / 2)
                                          for view in board.subviews {
                                             if view.backgroundColor != .white {
                                                view.backgroundColor = .black
                                                view.layer.borderWidth = 0
                                                 if moveGrayChecker(sender, board: viewBoard) == true {
                                                     currentPlayerMove = .gray
                                                     movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                 } else {
                                                     currentPlayerMove = .white
                                                     movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                 }
                                                }
                                            }
                                            canStepGray(sender, board: board)
                                            canStepWhite(sender, board: board)
                                            canStepQueenBlue(sender, board: board)
                                            canStepQueenRed(sender, board: board)
                                        } else {
                                           if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                               view.addSubview(checker)
                                               checker.center = CGPoint(
                                                                   x: checkerSquare.frame.height / 2,
                                                                   y: checkerSquare.frame.height / 2)
                                                    for view in board.subviews {
                                                          if moveGrayChecker(sender, board: viewBoard) == true {
                                                              currentPlayerMove = .gray
                                                              movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                          } else {
                                                              currentPlayerMove = .white
                                                              movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                          }
                                                          if view.backgroundColor != .white {
                                                             view.backgroundColor = .black
                                                             view.layer.borderWidth = 0
                                                          }
                                                    }
                                                   canStepGray(sender, board: board)
                                                   canStepWhite(sender, board: board)
                                                   canStepQueenBlue(sender, board: board)
                                                   canStepQueenRed(sender, board: board)
                                                }
                                        }
                     } else {
                         if  (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .red, currentPlayerMove == .gray, view.tag == (checkerSquare.tag - 28) {
                             if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .white || fourteenBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .white || twentyOneBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                 sevenBottom.first?.subviews.first?.removeFromSuperview()
                                 fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                 twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                 scoreGreyPlayer += 1
                                 greyPlayerScore.text = "\(scoreGreyPlayer)"
                                 gameIsFinish()
                                 view.addSubview(checker)
                                 checker.center = CGPoint(
                                                     x: checkerSquare.frame.height / 2,
                                                     y: checkerSquare.frame.height / 2)
                                for view in board.subviews {
                                      if view.backgroundColor != .white {
                                         view.backgroundColor = .black
                                         view.layer.borderWidth = 0
                                          if moveGrayChecker(sender, board: viewBoard) == true {
                                              currentPlayerMove = .gray
                                              movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                          } else {
                                              currentPlayerMove = .white
                                              movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                          }
                                      }
                                }
                                 canStepGray(sender, board: board)
                                 canStepWhite(sender, board: board)
                                 canStepQueenBlue(sender, board: board)
                                 canStepQueenRed(sender, board: board)
                            } else {
                                if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                    view.addSubview(checker)
                                    checker.center = CGPoint(
                                                        x: checkerSquare.frame.height / 2,
                                                        y: checkerSquare.frame.height / 2)
                                    for view in board.subviews {
                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                            currentPlayerMove = .gray
                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                        } else {
                                            currentPlayerMove = .white
                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                        }
                                        if view.backgroundColor != .white {
                                            view.backgroundColor = .black
                                            view.layer.borderWidth = 0
                                        }
                                    }
                                    canStepGray(sender, board: board)
                                    canStepWhite(sender, board: board)
                                    canStepQueenBlue(sender, board: board)
                                    canStepQueenRed(sender, board: board)
                                    }
                                }
                            } else {
                                   if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag - 35) {
                                       if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .white || fourteenBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .white || twentyOneBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightBottom.first?.subviews.first?.backgroundColor == .white || twentyEightBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                           sevenBottom.first?.subviews.first?.removeFromSuperview()
                                           fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                           twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                           twentyEightBottom.first?.subviews.first?.removeFromSuperview()
                                           scoreGreyPlayer += 1
                                           greyPlayerScore.text = "\(scoreGreyPlayer)"
                                           gameIsFinish()
                                           view.addSubview(checker)
                                           checker.center = CGPoint(
                                                               x: checkerSquare.frame.height / 2,
                                                               y: checkerSquare.frame.height / 2)
                                            for view in board.subviews {
                                                if view.backgroundColor != .white {
                                                    view.backgroundColor = .black
                                                    view.layer.borderWidth = 0
                                                    if moveGrayChecker(sender, board: viewBoard) == true {
                                                        currentPlayerMove = .gray
                                                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                    } else {
                                                        currentPlayerMove = .white
                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                    }
                                                }
                                            }
                                           canStepGray(sender, board: board)
                                           canStepWhite(sender, board: board)
                                           canStepQueenBlue(sender, board: board)
                                           canStepQueenRed(sender, board: board)
                                    } else {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                            view.addSubview(checker)
                                            checker.center = CGPoint(
                                                                x: checkerSquare.frame.height / 2,
                                                                y: checkerSquare.frame.height / 2)
                                            for view in board.subviews {
                                                if moveGrayChecker(sender, board: viewBoard) == true {
                                                    currentPlayerMove = .gray
                                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                } else {
                                                    currentPlayerMove = .white
                                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                }
                                                if view.backgroundColor != .white {
                                                    view.backgroundColor = .black
                                                    view.layer.borderWidth = 0
                                                }
                                            }
                                            canStepGray(sender, board: board)
                                            canStepWhite(sender, board: board)
                                            canStepQueenBlue(sender, board: board)
                                            canStepQueenRed(sender, board: board)
                                            }
                                        }
                                } else {
                                    if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag - 42) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .white || fourteenBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .white || twentyOneBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightBottom.first?.subviews.first?.backgroundColor == .white || twentyEightBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveBottom.first?.subviews.first?.backgroundColor == .white || thirtyFiveBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                twentyEightBottom.first?.subviews.first?.removeFromSuperview()
                                                thirtyFiveBottom.first?.subviews.first?.removeFromSuperview()
                                                scoreGreyPlayer += 1
                                                greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                gameIsFinish()
                                                view.addSubview(checker)
                                                checker.center = CGPoint(
                                                                x: checkerSquare.frame.height / 2,
                                                                y: checkerSquare.frame.height / 2)
                                                for view in board.subviews {
                                                    if view.backgroundColor != .white {
                                                        view.backgroundColor = .black
                                                        view.layer.borderWidth = 0
                                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                                            currentPlayerMove = .gray
                                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                        } else {
                                                            currentPlayerMove = .white
                                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                        }
                                                    }
                                                }
                                                canStepGray(sender, board: board)
                                                canStepWhite(sender, board: board)
                                                canStepQueenBlue(sender, board: board)
                                                canStepQueenRed(sender, board: board)
                            } else {
                                if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                    view.addSubview(checker)
                                    checker.center = CGPoint(
                                                        x: checkerSquare.frame.height / 2,
                                                        y: checkerSquare.frame.height / 2)
                                    for view in board.subviews {
                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                            currentPlayerMove = .gray
                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                        } else {
                                            currentPlayerMove = .white
                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                        }
                                        if view.backgroundColor != .white {
                                            view.backgroundColor = .black
                                            view.layer.borderWidth = 0
                                        }
                                    }
                                    canStepGray(sender, board: board)
                                    canStepWhite(sender, board: board)
                                    canStepQueenBlue(sender, board: board)
                                    canStepQueenRed(sender, board: board)
                                    }
                                }
                            } else {
                                    if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag - 49) {
                                         if view.subviews.isEmpty, view.backgroundColor != .white, ((sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .white || fourteenBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .white || twentyOneBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightBottom.first?.subviews.first?.backgroundColor == .white || twentyEightBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveBottom.first?.subviews.first?.backgroundColor == .white || thirtyFiveBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyTwoBottom.first?.subviews.first?.backgroundColor == .white || fortyTwoBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                twentyEightBottom.first?.subviews.first?.removeFromSuperview()
                                                thirtyFiveBottom.first?.subviews.first?.removeFromSuperview()
                                                fortyTwoBottom.first?.subviews.first?.removeFromSuperview()
                                                scoreGreyPlayer += 1
                                                greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                gameIsFinish()
                                                view.addSubview(checker)
                                                checker.center = CGPoint(
                                                                 x: checkerSquare.frame.height / 2,
                                                                 y: checkerSquare.frame.height / 2)
                                                for view in board.subviews {
                                                    if view.backgroundColor != .white {
                                                        view.backgroundColor = .black
                                                        view.layer.borderWidth = 0
                                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                                            currentPlayerMove = .gray
                                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                        } else {
                                                            currentPlayerMove = .white
                                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                        }
                                                    }
                                                }
                                                 canStepGray(sender, board: board)
                                                 canStepWhite(sender, board: board)
                                                 canStepQueenBlue(sender, board: board)
                                                 canStepQueenRed(sender, board: board)
                                            } else {
                                                if view.subviews.isEmpty, view.backgroundColor != .white, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                        view.addSubview(checker)
                                                        checker.center = CGPoint(
                                                                    x: checkerSquare.frame.height / 2,
                                                                    y: checkerSquare.frame.height / 2)
                                                        for view in board.subviews {
                                                            if moveGrayChecker(sender, board: viewBoard) == true {
                                                                currentPlayerMove = .gray
                                                                movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                                            } else {
                                                            currentPlayerMove = .white
                                                            movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                            }
                                                            if view.backgroundColor != .white {
                                                                view.backgroundColor = .black
                                                                view.layer.borderWidth = 0
                                                            }
                                                        }
                                                        canStepGray(sender, board: board)
                                                        canStepWhite(sender, board: board)
                                                        canStepQueenBlue(sender, board: board)
                                                        canStepQueenRed(sender, board: board)
                                                    }
                                                }
    } else {
        if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag - 27) {
             if view.subviews.isEmpty, view.backgroundColor != .white, ((nineBottom.first?.subviews.first?.backgroundColor == .white || nineBottom.first?.subviews.first?.backgroundColor == .red) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .white || eighteenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil)  {
                 nineBottom.first?.subviews.first?.removeFromSuperview()
                 eighteenBottom.first?.subviews.first?.removeFromSuperview()
                 scoreGreyPlayer += 1
                 greyPlayerScore.text = "\(scoreGreyPlayer)"
                 gameIsFinish()
                 view.addSubview(checker)
                 checker.center = CGPoint(
                                     x: checkerSquare.frame.height / 2,
                                     y: checkerSquare.frame.height / 2)
                   for view in board.subviews {
                     if view.backgroundColor != .white {
                        view.backgroundColor = .black
                        view.layer.borderWidth = 0
                         if moveGrayChecker(sender, board: viewBoard) == true {
                             currentPlayerMove = .gray
                             movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                         } else {
                             currentPlayerMove = .white
                             movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                         }
                     }
                 }
                 canStepGray(sender, board: board)
                 canStepWhite(sender, board: board)
                 canStepQueenBlue(sender, board: board)
                 canStepQueenRed(sender, board: board)
        } else {
            if view.subviews.isEmpty, view.backgroundColor != .white, nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                view.addSubview(checker)
                checker.center = CGPoint(
                                    x: checkerSquare.frame.height / 2,
                                    y: checkerSquare.frame.height / 2)
                for view in board.subviews {
                    if moveGrayChecker(sender, board: viewBoard) == true {
                        currentPlayerMove = .gray
                        movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                    } else {
                        currentPlayerMove = .white
                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                    }
                    if view.backgroundColor != .white {
                       view.backgroundColor = .black
                       view.layer.borderWidth = 0
                     }
                }
                canStepGray(sender, board: board)
                canStepWhite(sender, board: board)
                canStepQueenBlue(sender, board: board)
                canStepQueenRed(sender, board: board)
              }
          }
      } else {
          if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag - 36) {
              if view.subviews.isEmpty, view.backgroundColor != .white, ((nineBottom.first?.subviews.first?.backgroundColor == .white || nineBottom.first?.subviews.first?.backgroundColor == .red) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .white || eighteenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenBottom.first?.subviews.first?.backgroundColor == .white || twentySevenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                  nineBottom.first?.subviews.first?.removeFromSuperview()
                  eighteenBottom.first?.subviews.first?.removeFromSuperview()
                  twentySevenBottom.first?.subviews.first?.removeFromSuperview()
                  scoreGreyPlayer += 1
                  greyPlayerScore.text = "\(scoreGreyPlayer)"
                  gameIsFinish()
                  view.addSubview(checker)
                  checker.center = CGPoint(
                                      x: checkerSquare.frame.height / 2,
                                      y: checkerSquare.frame.height / 2)
                    for view in board.subviews {
                      if view.backgroundColor != .white {
                         view.backgroundColor = .black
                         view.layer.borderWidth = 0
                          if moveGrayChecker(sender, board: viewBoard) == true {
                              currentPlayerMove = .gray
                              movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                          } else {
                              currentPlayerMove = .white
                              movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                          }
                      }
                    }
                  canStepGray(sender, board: board)
                  canStepWhite(sender, board: board)
                  canStepQueenBlue(sender, board: board)
                  canStepQueenRed(sender, board: board)
        } else {
             if view.subviews.isEmpty, view.backgroundColor != .white, nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                 view.addSubview(checker)
                 checker.center = CGPoint(
                                     x: checkerSquare.frame.height / 2,
                                     y: checkerSquare.frame.height / 2)
                 for view in board.subviews {
                     if moveGrayChecker(sender, board: viewBoard) == true {
                         currentPlayerMove = .gray
                         movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                     } else {
                         currentPlayerMove = .white
                         movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                     }
                      if view.backgroundColor != .white {
                         view.backgroundColor = .black
                         view.layer.borderWidth = 0
                    }
                }
                 canStepGray(sender, board: board)
                 canStepWhite(sender, board: board)
                 canStepQueenBlue(sender, board: board)
                 canStepQueenRed(sender, board: board)
               }
            }
        } else {
            if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag - 45) {
                if view.subviews.isEmpty, view.backgroundColor != .white, ((nineBottom.first?.subviews.first?.backgroundColor == .white || nineBottom.first?.subviews.first?.backgroundColor == .red) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .white || eighteenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenBottom.first?.subviews.first?.backgroundColor == .white || twentySevenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixBottom.first?.subviews.first?.backgroundColor == .white || thirtySixBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                    nineBottom.first?.subviews.first?.removeFromSuperview()
                    eighteenBottom.first?.subviews.first?.removeFromSuperview()
                    twentySevenBottom.first?.subviews.first?.removeFromSuperview()
                    thirtySixBottom.first?.subviews.first?.removeFromSuperview()
                    scoreGreyPlayer += 1
                    greyPlayerScore.text = "\(scoreGreyPlayer)"
                    gameIsFinish()
                    view.addSubview(checker)
                    checker.center = CGPoint(
                                        x: checkerSquare.frame.height / 2,
                                        y: checkerSquare.frame.height / 2)
                    for view in board.subviews {
                      if view.backgroundColor != .white {
                         view.backgroundColor = .black
                         view.layer.borderWidth = 0
                          if moveGrayChecker(sender, board: viewBoard) == true {
                              currentPlayerMove = .gray
                              movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                          } else {
                              currentPlayerMove = .white
                              movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                          }
                      }
                    }
                    canStepGray(sender, board: board)
                    canStepWhite(sender, board: board)
                    canStepQueenBlue(sender, board: board)
                    canStepQueenRed(sender, board: board)
             } else {
                if view.subviews.isEmpty, view.backgroundColor != .white, nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil {
                    view.addSubview(checker)
                    checker.center = CGPoint(
                                        x: checkerSquare.frame.height / 2,
                                        y: checkerSquare.frame.height / 2)
                     for view in board.subviews {
                         if moveGrayChecker(sender, board: viewBoard) == true {
                             currentPlayerMove = .gray
                             movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                         } else {
                             currentPlayerMove = .white
                             movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                         }
                         if view.backgroundColor != .white {
                             view.backgroundColor = .black
                             view.layer.borderWidth = 0
                         }
                     }
                    canStepGray(sender, board: board)
                    canStepWhite(sender, board: board)
                    canStepQueenBlue(sender, board: board)
                    canStepQueenRed(sender, board: board)
               }
            }
        } else {
             if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), checker.backgroundColor == .blue, currentPlayerMove == .gray, view.tag == (checkerSquare.tag - 54) {
                 if view.subviews.isEmpty, view.backgroundColor != .white, ((nineBottom.first?.subviews.first?.backgroundColor == .white || nineBottom.first?.subviews.first?.backgroundColor == .red) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .white || eighteenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenBottom.first?.subviews.first?.backgroundColor == .white || twentySevenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixBottom.first?.subviews.first?.backgroundColor == .white || thirtySixBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyFiveBottom.first?.subviews.first?.backgroundColor == .white || fortyFiveBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                     nineBottom.first?.subviews.first?.removeFromSuperview()
                     eighteenBottom.first?.subviews.first?.removeFromSuperview()
                     twentySevenBottom.first?.subviews.first?.removeFromSuperview()
                     thirtySixBottom.first?.subviews.first?.removeFromSuperview()
                     fortyFiveBottom.first?.subviews.first?.removeFromSuperview()
                     scoreGreyPlayer += 1
                     greyPlayerScore.text = "\(scoreGreyPlayer)"
                     gameIsFinish()
                     view.addSubview(checker)
                     checker.center = CGPoint(
                                         x: checkerSquare.frame.height / 2,
                                         y: checkerSquare.frame.height / 2)
                     for view in board.subviews {
                       if view.backgroundColor != .white {
                       view.backgroundColor = .black
                       view.layer.borderWidth = 0
                           if moveGrayChecker(sender, board: viewBoard) == true {
                               currentPlayerMove = .gray
                               movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                           } else {
                               currentPlayerMove = .white
                               movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                           }
                       }
                     }
                     canStepGray(sender, board: board)
                     canStepWhite(sender, board: board)
                     canStepQueenBlue(sender, board: board)
                     canStepQueenRed(sender, board: board)
            } else {
                if view.subviews.isEmpty, view.backgroundColor != .white, nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil {
                     view.addSubview(checker)
                    checker.center = CGPoint(
                                        x: checkerSquare.frame.height / 2,
                                        y: checkerSquare.frame.height / 2)
                     for view in board.subviews {
                         if moveGrayChecker(sender, board: viewBoard) == true {
                             currentPlayerMove = .gray
                             movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                         } else {
                             currentPlayerMove = .white
                             movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                         }
                         if view.backgroundColor != .white {
                             view.backgroundColor = .black
                             view.layer.borderWidth = 0
                         }
                     }
                    canStepGray(sender, board: board)
                    canStepWhite(sender, board: board)
                    canStepQueenBlue(sender, board: board)
                    canStepQueenRed(sender, board: board)
                   }
                }
             } else {
                 if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), currentPlayerMove == .gray, checker.backgroundColor == .yellow, view.tag == (checkerSquare.tag + 14) {
                     if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first?.subviews.first?.backgroundColor == .white || sevenTop.first?.subviews.first?.backgroundColor == .red  {
                         sevenTop.first?.subviews.first?.removeFromSuperview()
                         scoreGreyPlayer += 1
                         greyPlayerScore.text = "\(scoreGreyPlayer)"
                         gameIsFinish()
                         view.addSubview(checker)
                         checker.center = CGPoint(
                                             x: checkerSquare.frame.height / 2,
                                             y: checkerSquare.frame.height / 2)
                        for view in board.subviews {
                            if view.backgroundColor != .white {
                                view.backgroundColor = .black
                                view.layer.borderWidth = 0
                                if moveGrayChecker(sender, board: viewBoard) == true {
                                    currentPlayerMove = .gray
                                    movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                } else {
                                    currentPlayerMove = .white
                                    movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                }
                            }
                        }
                         canStepGray(sender, board: board)
                         canStepWhite(sender, board: board)
                         canStepQueenBlue(sender, board: board)
                         canStepQueenRed(sender, board: board)
                    } else {
                        if view.subviews.isEmpty, view.backgroundColor != .white, sevenTop.first(where: {$0.subviews.isEmpty}) != nil {
                            view.addSubview(checker)
                            checker.center = CGPoint(
                                                x: checkerSquare.frame.height / 2,
                                                y: checkerSquare.frame.height / 2)
                            for view in board.subviews {
                                if view.backgroundColor != .white {
                                    view.backgroundColor = .black
                                    view.layer.borderWidth = 0
                                        if moveGrayChecker(sender, board: viewBoard) == true {
                                            currentPlayerMove = .gray
                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                        } else {
                                        currentPlayerMove = .white
                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                        }
                                    }
                                }
                            canStepGray(sender, board: board)
                            canStepWhite(sender, board: board)
                            canStepQueenBlue(sender, board: board)
                            canStepQueenRed(sender, board: board)
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
        }
    }
}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
