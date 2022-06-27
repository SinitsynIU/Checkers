//
//  MoveLogics.swift
//  Checkers
//
//  Created by Илья Синицын on 16.06.2022.
//

import UIKit

extension StartGameViewController {
    
    func moveWhiteChecker(_ sender: UIPanGestureRecognizer, board: UIView) -> Bool {
        guard let checker = sender.view, let checkerSquare = checker.superview else { return true}
        var takeStep: Bool?
        let sevenTop = board.subviews.filter{($0.tag == (checkerSquare.tag) + 7)}
        let nineTop = board.subviews.filter{($0.tag == (checkerSquare.tag) + 9)}
        let fourteenTop = board.subviews.filter{($0.tag == checkerSquare.tag + 14)}
        let eighteenTop = board.subviews.filter{($0.tag == checkerSquare.tag + 18)}
        let twentyOneTop = board.subviews.filter{($0.tag == checkerSquare.tag + 21)}
        let twentySevenTop = board.subviews.filter{($0.tag == checkerSquare.tag + 27)}
        let twentyEightTop = board.subviews.filter{($0.tag == checkerSquare.tag + 28)}
        let thirtyFiveTop = board.subviews.filter{($0.tag == checkerSquare.tag + 35)}
        let thirtySixTop = board.subviews.filter{($0.tag == checkerSquare.tag + 36)}
        let fortyTwoTop = board.subviews.filter{($0.tag == checkerSquare.tag + 42)}
        let fortyFiveTop = board.subviews.filter{($0.tag == checkerSquare.tag + 45)}
        let sevenBottom = board.subviews.filter{($0.tag == (checkerSquare.tag) - 7)}
        let nineBottom = board.subviews.filter{($0.tag == (checkerSquare.tag) - 9)}
        let fourteenBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 14)}
        let eighteenBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 18)}
        let twentyOneBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 21)}
        let twentySevenBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 27)}
        let twentyEightBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 28)}
        let thirtyFiveBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 35)}
        let thirtySixBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 36)}
        let fortyTwoBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 42)}
        let fortyFiveBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 45)}
        
        for view in board.subviews {
            if checker.backgroundColor == .white || checker.backgroundColor == .red, view.tag == (checkerSquare.tag + 14), checkerSquare.tag < 48 {
                if view.subviews.isEmpty, view.backgroundColor == .black, sevenTop.first?.subviews.first?.backgroundColor == .gray || sevenTop.first?.subviews.first?.backgroundColor == .blue {
                    takeStep = true
                }
            } else {
                if checker.backgroundColor == .white || checker.backgroundColor == .red, view.tag == (checkerSquare.tag + 18), checkerSquare.tag < 48 {
                    if view.subviews.isEmpty, view.backgroundColor == .black, nineTop.first?.subviews.first?.backgroundColor == .gray || nineTop.first?.subviews.first?.backgroundColor == .blue {
                        takeStep = true
                    }
                } else {
                    if checker.backgroundColor == .white || checker.backgroundColor == .red, view.tag == (checkerSquare.tag - 14), checkerSquare.tag > 15 {
                        if view.subviews.isEmpty, view.backgroundColor == .black, sevenBottom.first?.subviews.first?.backgroundColor == .gray || sevenBottom.first?.subviews.first?.backgroundColor == .blue {
                            takeStep = true
                        }
                    } else {
                        if checker.backgroundColor == .white || checker.backgroundColor == .red, view.tag == (checkerSquare.tag - 18), checkerSquare.tag > 15 {
                            if view.subviews.isEmpty, view.backgroundColor == .black, nineBottom.first?.subviews.first?.backgroundColor == .gray || nineBottom.first?.subviews.first?.backgroundColor == .blue {
                                takeStep = true
                            }
                        } else {
                            if checker.backgroundColor == .red, view.tag == (checkerSquare.tag + 27) {
                                if view.subviews.isEmpty, view.backgroundColor == .black, ((nineTop.first?.subviews.first?.backgroundColor == .gray || nineTop.first?.subviews.first?.backgroundColor == .blue) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .gray || eighteenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                    takeStep = true
                                } else {
                                    if checker.backgroundColor == .red, view.tag == (checkerSquare.tag + 36) {
                                        if view.subviews.isEmpty, view.backgroundColor == .black, ((nineTop.first?.subviews.first?.backgroundColor == .gray || nineTop.first?.subviews.first?.backgroundColor == .blue) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .gray || eighteenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenTop.first?.subviews.first?.backgroundColor == .gray || twentySevenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil)  {
                                            takeStep = true
                                        }
} else {
    if checker.backgroundColor == .red, view.tag == (checkerSquare.tag + 45) {
        if view.subviews.isEmpty, view.backgroundColor == .black, ((nineTop.first?.subviews.first?.backgroundColor == .gray || nineTop.first?.subviews.first?.backgroundColor == .blue) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .gray || eighteenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenTop.first?.subviews.first?.backgroundColor == .gray || twentySevenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixTop.first?.subviews.first?.backgroundColor == .gray || thirtySixTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil)   {
            takeStep = true
        }
    } else {
        if checker.backgroundColor == .red, view.tag == (checkerSquare.tag + 54) {
            if view.subviews.isEmpty, view.backgroundColor == .black, ((nineTop.first?.subviews.first?.backgroundColor == .gray || nineTop.first?.subviews.first?.backgroundColor == .blue) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .gray || eighteenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenTop.first?.subviews.first?.backgroundColor == .gray || twentySevenTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixTop.first?.subviews.first?.backgroundColor == .gray || thirtySixTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil  && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyFiveTop.first?.subviews.first?.backgroundColor == .gray || fortyFiveTop.first?.subviews.first?.backgroundColor == .blue) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil)    {
                takeStep = true
            }
         } else {
            if checker.backgroundColor == .red, view.tag == (checkerSquare.tag + 21) {
                if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenTop.first?.subviews.first?.backgroundColor == .gray || sevenTop.first?.subviews.first?.backgroundColor == .blue) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .gray || fourteenTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                    takeStep = true
                }
            } else {
                if checker.backgroundColor == .red, view.tag == (checkerSquare.tag + 28) {
                    if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenTop.first?.subviews.first?.backgroundColor == .gray || sevenTop.first?.subviews.first?.backgroundColor == .blue) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .gray || fourteenTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .gray || twentyOneTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                        takeStep = true
                    }
                } else {
                    if checker.backgroundColor == .red, view.tag == (checkerSquare.tag + 35) {
                        if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenTop.first?.subviews.first?.backgroundColor == .gray || sevenTop.first?.subviews.first?.backgroundColor == .blue) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .gray || fourteenTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .gray || twentyOneTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightTop.first?.subviews.first?.backgroundColor == .gray || twentyEightTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) {
                            takeStep = true
                    }
                } else {
                    if checker.backgroundColor == .red, view.tag == (checkerSquare.tag + 42) {
                        if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenTop.first?.subviews.first?.backgroundColor == .gray || sevenTop.first?.subviews.first?.backgroundColor == .blue) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .gray || fourteenTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .gray || twentyOneTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightTop.first?.subviews.first?.backgroundColor == .gray || twentyEightTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveTop.first?.subviews.first?.backgroundColor == .gray || thirtyFiveTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) {
                            takeStep = true
                                                                }
                    } else {
                        if checker.backgroundColor == .red, view.tag == (checkerSquare.tag + 49) {
                            if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenTop.first?.subviews.first?.backgroundColor == .gray || sevenTop.first?.subviews.first?.backgroundColor == .blue) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .gray || fourteenTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .gray || twentyOneTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightTop.first?.subviews.first?.backgroundColor == .gray || twentyEightTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveTop.first?.subviews.first?.backgroundColor == .gray || thirtyFiveTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyTwoTop.first?.subviews.first?.backgroundColor == .gray || fortyTwoTop.first?.subviews.first?.backgroundColor == .blue) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                takeStep = true
                            }
                        } else {
                            if checker.backgroundColor == .red, view.tag == (checkerSquare.tag - 27) {
                                if view.subviews.isEmpty, view.backgroundColor == .black, ((nineBottom.first?.subviews.first?.backgroundColor == .gray || nineBottom.first?.subviews.first?.backgroundColor == .blue) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .gray || eighteenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                    takeStep = true
                                } else {
                                    if checker.backgroundColor == .red, view.tag == (checkerSquare.tag - 36) {
                                        if view.subviews.isEmpty, view.backgroundColor == .black, ((nineBottom.first?.subviews.first?.backgroundColor == .gray || nineBottom.first?.subviews.first?.backgroundColor == .blue) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .gray || eighteenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenBottom.first?.subviews.first?.backgroundColor == .gray || twentySevenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil)  {
                                            takeStep = true
                                        }
} else {
    if checker.backgroundColor == .red, view.tag == (checkerSquare.tag - 45) {
        if view.subviews.isEmpty, view.backgroundColor == .black, ((nineBottom.first?.subviews.first?.backgroundColor == .gray || nineBottom.first?.subviews.first?.backgroundColor == .blue) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .gray || eighteenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenBottom.first?.subviews.first?.backgroundColor == .gray || twentySevenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixBottom.first?.subviews.first?.backgroundColor == .gray || thirtySixBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil)   {
            takeStep = true
           }
    } else {
        if checker.backgroundColor == .red, view.tag == (checkerSquare.tag - 54) {
            if view.subviews.isEmpty, view.backgroundColor == .black, ((nineBottom.first?.subviews.first?.backgroundColor == .gray || nineBottom.first?.subviews.first?.backgroundColor == .blue) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .gray || eighteenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenBottom.first?.subviews.first?.backgroundColor == .gray || twentySevenBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixBottom.first?.subviews.first?.backgroundColor == .gray || thirtySixBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyFiveBottom.first?.subviews.first?.backgroundColor == .gray || fortyFiveBottom.first?.subviews.first?.backgroundColor == .blue) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                takeStep = true
            }
        } else {
            if checker.backgroundColor == .red, view.tag == (checkerSquare.tag - 21) {
                if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenBottom.first?.subviews.first?.backgroundColor == .gray || sevenBottom.first?.subviews.first?.backgroundColor == .blue) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .gray || fourteenBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                    takeStep = true
                }
            } else {
                if checker.backgroundColor == .red, view.tag == (checkerSquare.tag - 28) {
                    if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenBottom.first?.subviews.first?.backgroundColor == .gray || sevenBottom.first?.subviews.first?.backgroundColor == .blue) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .gray || fourteenBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .gray || twentyOneBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                        takeStep = true
                    }
                } else {
                     if checker.backgroundColor == .red, view.tag == (checkerSquare.tag - 35) {
                        if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenBottom.first?.subviews.first?.backgroundColor == .gray || sevenBottom.first?.subviews.first?.backgroundColor == .blue) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .gray || fourteenBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .gray || twentyOneBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightBottom.first?.subviews.first?.backgroundColor == .gray || twentyEightBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                            takeStep = true
                        }
                     } else {
                         if checker.backgroundColor == .red, view.tag == (checkerSquare.tag - 42) {
                            if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenBottom.first?.subviews.first?.backgroundColor == .gray || sevenBottom.first?.subviews.first?.backgroundColor == .blue) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .gray || fourteenBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .gray || twentyOneBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightBottom.first?.subviews.first?.backgroundColor == .gray || twentyEightBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveBottom.first?.subviews.first?.backgroundColor == .gray || thirtyFiveBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                takeStep = true
                              }
} else {
    if checker.backgroundColor == .red, view.tag == (checkerSquare.tag - 49) {
        if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenBottom.first?.subviews.first?.backgroundColor == .gray || sevenBottom.first?.subviews.first?.backgroundColor == .blue) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .gray || fourteenBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .gray || twentyOneBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightBottom.first?.subviews.first?.backgroundColor == .gray || twentyEightBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveBottom.first?.subviews.first?.backgroundColor == .gray || thirtyFiveBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyTwoBottom.first?.subviews.first?.backgroundColor == .gray || fortyTwoBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) {
            takeStep = true
              }
          }
      }
}}}}}}}}}}}}}}}}}}}}}}}
        return takeStep ?? false
}
    
    func moveGrayChecker(_ sender: UIPanGestureRecognizer, board: UIView) -> Bool {
        guard let checker = sender.view, let checkerSquare = checker.superview else { return true}
        var takeStep: Bool?
        let sevenTop = board.subviews.filter{($0.tag == (checkerSquare.tag) + 7)}
        let nineTop = board.subviews.filter{($0.tag == (checkerSquare.tag) + 9)}
        let fourteenTop = board.subviews.filter{($0.tag == checkerSquare.tag + 14)}
        let eighteenTop = board.subviews.filter{($0.tag == checkerSquare.tag + 18)}
        let twentyOneTop = board.subviews.filter{($0.tag == checkerSquare.tag + 21)}
        let twentySevenTop = board.subviews.filter{($0.tag == checkerSquare.tag + 27)}
        let twentyEightTop = board.subviews.filter{($0.tag == checkerSquare.tag + 28)}
        let thirtyFiveTop = board.subviews.filter{($0.tag == checkerSquare.tag + 35)}
        let thirtySixTop = board.subviews.filter{($0.tag == checkerSquare.tag + 36)}
        let fortyTwoTop = board.subviews.filter{($0.tag == checkerSquare.tag + 42)}
        let fortyFiveTop = board.subviews.filter{($0.tag == checkerSquare.tag + 45)}
        let sevenBottom = board.subviews.filter{($0.tag == (checkerSquare.tag) - 7)}
        let nineBottom = board.subviews.filter{($0.tag == (checkerSquare.tag) - 9)}
        let fourteenBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 14)}
        let eighteenBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 18)}
        let twentyOneBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 21)}
        let twentySevenBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 27)}
        let twentyEightBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 28)}
        let thirtyFiveBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 35)}
        let thirtySixBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 36)}
        let fortyTwoBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 42)}
        let fortyFiveBottom = board.subviews.filter{($0.tag == checkerSquare.tag - 45)}
        
        for view in board.subviews {
            if checker.backgroundColor == .gray || checker.backgroundColor == .blue, view.tag == (checkerSquare.tag + 14), checkerSquare.tag < 48 {
                if view.subviews.isEmpty, view.backgroundColor == .black, sevenTop.first?.subviews.first?.backgroundColor == .white || sevenTop.first?.subviews.first?.backgroundColor == .red {
                    takeStep = true
                }
            } else {
                if checker.backgroundColor == .gray || checker.backgroundColor == .blue, view.tag == (checkerSquare.tag + 18), checkerSquare.tag < 48 {
                    if view.subviews.isEmpty, view.backgroundColor == .black, nineTop.first?.subviews.first?.backgroundColor == .white || nineTop.first?.subviews.first?.backgroundColor == .red {
                        takeStep = true
                    }
                } else {
                    if checker.backgroundColor == .gray || checker.backgroundColor == .blue, view.tag == (checkerSquare.tag - 14), checkerSquare.tag > 15 {
                        if view.subviews.isEmpty, view.backgroundColor == .black, sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red {
                            takeStep = true
                        }
                    } else {
                        if checker.backgroundColor == .gray || checker.backgroundColor == .blue, view.tag == (checkerSquare.tag - 18), checkerSquare.tag > 15 {
                            if view.subviews.isEmpty, view.backgroundColor == .black, nineBottom.first?.subviews.first?.backgroundColor == .white || nineBottom.first?.subviews.first?.backgroundColor == .red {
                                takeStep = true
                            }
                        } else {
                            if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag + 27) {
                                if view.subviews.isEmpty, view.backgroundColor == .black, ((nineTop.first?.subviews.first?.backgroundColor == .white || nineTop.first?.subviews.first?.backgroundColor == .red) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .white || eighteenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                    takeStep = true
                                } else {
                                    if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag + 36) {
                                        if view.subviews.isEmpty, view.backgroundColor == .black, ((nineTop.first?.subviews.first?.backgroundColor == .white || nineTop.first?.subviews.first?.backgroundColor == .red) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .white || eighteenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenTop.first?.subviews.first?.backgroundColor == .white || twentySevenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil)  {
                                            takeStep = true
                                        }
                                    } else {
                                        if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag + 45) {
                                            if view.subviews.isEmpty, view.backgroundColor == .black, ((nineTop.first?.subviews.first?.backgroundColor == .white || nineTop.first?.subviews.first?.backgroundColor == .red) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .white || eighteenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenTop.first?.subviews.first?.backgroundColor == .white || twentySevenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixTop.first?.subviews.first?.backgroundColor == .white || thirtySixTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil)   {
                                                takeStep = true
                                            }
 } else {
     if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag + 54) {
        if view.subviews.isEmpty, view.backgroundColor == .black, ((nineTop.first?.subviews.first?.backgroundColor == .white || nineTop.first?.subviews.first?.backgroundColor == .red) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenTop.first?.subviews.first?.backgroundColor == .white || eighteenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenTop.first?.subviews.first?.backgroundColor == .white || twentySevenTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixTop.first?.subviews.first?.backgroundColor == .white || thirtySixTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil  && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyFiveTop.first?.subviews.first?.backgroundColor == .white || fortyFiveTop.first?.subviews.first?.backgroundColor == .red) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil)    {
            takeStep = true
        }
     } else {
         if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag + 21) {
            if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenTop.first?.subviews.first?.backgroundColor == .white || sevenTop.first?.subviews.first?.backgroundColor == .red) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .white || fourteenTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                takeStep = true
            }
         } else {
             if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag + 28) {
                if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenTop.first?.subviews.first?.backgroundColor == .white || sevenTop.first?.subviews.first?.backgroundColor == .red) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .white || fourteenTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .white || twentyOneTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                    takeStep = true
                 }
              } else {
                  if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag + 35) {
                     if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenTop.first?.subviews.first?.backgroundColor == .white || sevenTop.first?.subviews.first?.backgroundColor == .red) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .white || fourteenTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .white || twentyOneTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightTop.first?.subviews.first?.backgroundColor == .white || twentyEightTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) {
                         takeStep = true
                    }
                 } else {
                     if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag + 42) {
                        if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenTop.first?.subviews.first?.backgroundColor == .white || sevenTop.first?.subviews.first?.backgroundColor == .red) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .white || fourteenTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .white || twentyOneTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightTop.first?.subviews.first?.backgroundColor == .white || twentyEightTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveTop.first?.subviews.first?.backgroundColor == .white || thirtyFiveTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) {
                            takeStep = true
                         }
} else {
    if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag + 49) {
         if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenTop.first?.subviews.first?.backgroundColor == .white || sevenTop.first?.subviews.first?.backgroundColor == .red) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenTop.first?.subviews.first?.backgroundColor == .white || fourteenTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneTop.first?.subviews.first?.backgroundColor == .white || twentyOneTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightTop.first?.subviews.first?.backgroundColor == .white || twentyEightTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveTop.first?.subviews.first?.backgroundColor == .white || thirtyFiveTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyTwoTop.first?.subviews.first?.backgroundColor == .white || fortyTwoTop.first?.subviews.first?.backgroundColor == .red) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) {
             takeStep = true
        }
    } else {
        if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag - 27) {
            if view.subviews.isEmpty, view.backgroundColor == .black, ((nineBottom.first?.subviews.first?.backgroundColor == .white || nineBottom.first?.subviews.first?.backgroundColor == .red) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .gray || eighteenBottom.first?.subviews.first?.backgroundColor == .blue) &&  nineBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                takeStep = true
            }
        } else {
            if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag - 36) {
                if view.subviews.isEmpty, view.backgroundColor == .black, ((nineBottom.first?.subviews.first?.backgroundColor == .white || nineBottom.first?.subviews.first?.backgroundColor == .red) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .white || eighteenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenBottom.first?.subviews.first?.backgroundColor == .white || twentySevenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil)  {
                    takeStep = true
                }
            } else {
                if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag - 45) {
                     if view.subviews.isEmpty, view.backgroundColor == .black, ((nineBottom.first?.subviews.first?.backgroundColor == .white || nineBottom.first?.subviews.first?.backgroundColor == .red) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .white || eighteenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenBottom.first?.subviews.first?.backgroundColor == .white || twentySevenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixBottom.first?.subviews.first?.backgroundColor == .white || thirtySixBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil)   {
                         takeStep = true
                    }
                } else {
                    if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag - 54) {
                       if view.subviews.isEmpty, view.backgroundColor == .black, ((nineBottom.first?.subviews.first?.backgroundColor == .white || nineBottom.first?.subviews.first?.backgroundColor == .red) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((eighteenBottom.first?.subviews.first?.backgroundColor == .white || eighteenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentySevenBottom.first?.subviews.first?.backgroundColor == .white || twentySevenBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtySixBottom.first?.subviews.first?.backgroundColor == .white || thirtySixBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyFiveBottom.first?.subviews.first?.backgroundColor == .white || fortyFiveBottom.first?.subviews.first?.backgroundColor == .red) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                           takeStep = true
                        }
                    } else {
                        if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag - 21) {
                           if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .gray || fourteenBottom.first?.subviews.first?.backgroundColor == .blue) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                               takeStep = true
                           }
                        } else {
                            if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag - 28) {
                               if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .white || fourteenBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .white || twentyOneBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                   takeStep = true
                                }
                            } else {
                                if checker.backgroundColor == .red, view.tag == (checkerSquare.tag - 35) {
                                   if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .white || fourteenBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .white || twentyOneBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightBottom.first?.subviews.first?.backgroundColor == .white || twentyEightBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                       takeStep = true
                                    }
  } else {
      if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag - 42) {
          if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .white || fourteenBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .white || twentyOneBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightBottom.first?.subviews.first?.backgroundColor == .white || twentyEightBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveBottom.first?.subviews.first?.backgroundColor == .white || thirtyFiveBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) {
              takeStep = true
           }
       } else {
           if checker.backgroundColor == .blue, view.tag == (checkerSquare.tag - 49) {
               if view.subviews.isEmpty, view.backgroundColor == .black, ((sevenBottom.first?.subviews.first?.backgroundColor == .white || sevenBottom.first?.subviews.first?.backgroundColor == .red) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((fourteenBottom.first?.subviews.first?.backgroundColor == .white || fourteenBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyOneBottom.first?.subviews.first?.backgroundColor == .white || twentyOneBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((twentyEightBottom.first?.subviews.first?.backgroundColor == .white || twentyEightBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) || ((thirtyFiveBottom.first?.subviews.first?.backgroundColor == .white || thirtyFiveBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) || ((fortyTwoBottom.first?.subviews.first?.backgroundColor == .white || fortyTwoBottom.first?.subviews.first?.backgroundColor == .red) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                   takeStep = true
                }
            }
        }
  }}}}}}}}}}}}}}}}}}}}}}
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
            queenStepsWhite(sender, board: viewBoard)
            for view in viewBoard.subviews {
                if view.frame.contains(sender.location(in: viewBoard)) {
                    if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .white, currentPlayerMove == .white, (view.tag == (checkerSquare.tag + 14)) {
                        if view.subviews.isEmpty, view.backgroundColor != .white,  (filterSevenTop.first(where: {$0.subviews.isEmpty}) == nil), filterSevenTop.first?.subviews.first?.backgroundColor == .gray || filterSevenTop.first?.subviews.first?.backgroundColor == .blue {
                            filterSevenTop.first?.subviews.first?.removeFromSuperview()
                            scoreWhitePlayer += 1
                            whitePleyerScore.text = "\(scoreWhitePlayer)"
                            gameIsFinish()
                            view.addSubview(checker)
                            if  queenWhiteOfCheckers(sender, board: viewBoard) == true {
                                checker.backgroundColor = .red
                            }
                            checker.center = CGPoint(
                                            x: checkerSquare.frame.height / 2,
                                            y: checkerSquare.frame.height / 2)
                            for view in viewBoard.subviews {
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
                            canStepGray(sender, board: viewBoard)
                            canStepWhite(sender, board: viewBoard)
                            canStepQueenBlue(sender, board: viewBoard)
                            canStepQueenRed(sender, board: viewBoard)
                        }
                    } else {
                        if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty),checker.backgroundColor == .white, currentPlayerMove == .white, (view.tag == (checkerSquare.tag + 18)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white, (filterNineTop.first(where: {$0.subviews.isEmpty}) == nil), filterNineTop.first?.subviews.first?.backgroundColor == .gray || filterNineTop.first?.subviews.first?.backgroundColor == .blue {
                                filterNineTop.first?.subviews.first?.removeFromSuperview()
                                scoreWhitePlayer += 1
                                whitePleyerScore.text = "\(scoreWhitePlayer)"
                                gameIsFinish()
                                view.addSubview(checker)
                                if  queenWhiteOfCheckers(sender, board: viewBoard)   == true {
                                    checker.backgroundColor = .red
                                }
                                checker.center = CGPoint(
                                                x: checkerSquare.frame.height / 2,
                                                y: checkerSquare.frame.height / 2)
                                for view in viewBoard.subviews {
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
                                canStepGray(sender, board: viewBoard)
                                canStepWhite(sender, board: viewBoard)
                                canStepQueenBlue(sender, board: viewBoard)
                                canStepQueenRed(sender, board: viewBoard)
                            }
                        } else {
                            if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .white || checker.backgroundColor == .red, currentPlayerMove == .white,
                                (view.tag == (checkerSquare.tag + 7) || view.tag == (checkerSquare.tag + 9)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white, ((filterFourteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterSevenBottom.first?.subviews.first?.backgroundColor != .gray) || (filterEighteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterSevenBottom.first?.subviews.first?.backgroundColor != .gray)) {
                                            view.addSubview(checker)
                                    if  queenWhiteOfCheckers(sender, board: viewBoard) == true {
                                        checker.backgroundColor = .red
                                    }
                                            checker.center = CGPoint(
                                                    x: checkerSquare.frame.height / 2,
                                                    y: checkerSquare.frame.height / 2)
                                    for view in viewBoard.subviews {
                                        if view.backgroundColor != .white {
                                            view.backgroundColor = .black
                                            view.layer.borderWidth = 0
                                        }
                                    }
                                            currentPlayerMove = .gray
                                            movePlayerLabel.text = "moveGreyPlayerLabel_text_startGameVC".localized
                                    canStepGray(sender, board: viewBoard)
                                    canStepWhite(sender, board: viewBoard)
                                    canStepQueenBlue(sender, board: viewBoard)
                                    canStepQueenRed(sender, board: viewBoard)
                                        }
//   MARK: MOVE WHITE BACK
                            } else {
                                if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .white, currentPlayerMove == .white,
                                   (view.tag == (checkerSquare.tag - 14)) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterSevenBottom.first?.subviews.first?.backgroundColor == .gray || filterSevenBottom.first?.subviews.first?.backgroundColor == .blue {
                                        filterSevenBottom.first?.subviews.first?.removeFromSuperview()
                                        scoreWhitePlayer += 1
                                        whitePleyerScore.text = "\(scoreWhitePlayer)"
                                        gameIsFinish()
                                        view.addSubview(checker)
                                        if  queenWhiteOfCheckers(sender, board: viewBoard) == true {
                                            checker.backgroundColor = .red
                                        }
                                        checker.center = CGPoint(
                                                        x: checkerSquare.frame.height / 2,
                                                        y: checkerSquare.frame.height / 2)
                                        for view in viewBoard.subviews {
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
                                        canStepGray(sender, board: viewBoard)
                                        canStepWhite(sender, board: viewBoard)
                                        canStepQueenBlue(sender, board: viewBoard)
                                        canStepQueenRed(sender, board: viewBoard)
                                    }
                                } else {
                                    if (arrayOfPossibleStepsWhite.contains(checkerSquare.tag) || arrayOfPossibleStepsWhite.isEmpty), (arrayOfPossibleStepsQueenRed.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenRed.isEmpty), checker.backgroundColor == .white, currentPlayerMove == .white, (view.tag == (checkerSquare.tag - 18)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterNineBottom.first?.subviews.first?.backgroundColor == .gray || filterNineBottom.first?.subviews.first?.backgroundColor == .blue  {
                                            filterNineBottom.first?.subviews.first?.removeFromSuperview()
                                            scoreWhitePlayer += 1
                                            whitePleyerScore.text = "\(scoreWhitePlayer)"
                                            gameIsFinish()
                                            view.addSubview(checker)
                                            if  queenWhiteOfCheckers(sender, board: viewBoard) == true {
                                                checker.backgroundColor = .red
                                            }
                                            checker.center = CGPoint(
                                                            x: checkerSquare.frame.height / 2,
                                                            y: checkerSquare.frame.height / 2)
                                            for view in viewBoard.subviews {
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
                                            canStepGray(sender, board: viewBoard)
                                            canStepWhite(sender, board: viewBoard)
                                            canStepQueenBlue(sender, board: viewBoard)
                                            canStepQueenRed(sender, board: viewBoard)
                                        }
//  MARK: MOVE GREY FORWARD
                                            } else {
                                                if (arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty), (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), currentPlayerMove == .gray, checker.backgroundColor == .gray, view.tag == (checkerSquare.tag - 18) {
                                                    if view.subviews.isEmpty, view.backgroundColor != .white,  filterNineBottom.first?.subviews.first?.backgroundColor == .white || filterNineBottom.first?.subviews.first?.backgroundColor == .red {
                                                        filterNineBottom.first?.subviews.first?.removeFromSuperview()
                                                        scoreGreyPlayer += 1
                                                        greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                        gameIsFinish()
                                                        if checker.backgroundColor == .gray && view.tag < 8 {
                                                            checker.backgroundColor = .blue
                                                        }
                                                        view.addSubview(checker)
                                                        if  queenGrayOfCheckers(sender, board: viewBoard) == true {
                                                            checker.backgroundColor = .blue
                                                        }
                                                        checker.center = CGPoint(
                                                                        x: checkerSquare.frame.height / 2,
                                                                        y: checkerSquare.frame.height / 2)
                                                        for view in viewBoard.subviews {
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
                                                        canStepGray(sender, board: viewBoard)
                                                        canStepWhite(sender, board: viewBoard)
                                                        canStepQueenBlue(sender, board: viewBoard)
                                                        canStepQueenRed(sender, board: viewBoard)
                                                    }
                                                } else {
                                                    if arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty, (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), currentPlayerMove == .gray, checker.backgroundColor == .gray, view.tag == (checkerSquare.tag - 14) {
                                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterSevenBottom.first?.subviews.first?.backgroundColor == .white || filterSevenBottom.first?.subviews.first?.backgroundColor == .red {
                                                            filterSevenBottom.first?.subviews.first?.removeFromSuperview()
                                                            scoreGreyPlayer += 1
                                                            greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                            gameIsFinish()
                                                            view.addSubview(checker)
                                                            if  queenGrayOfCheckers(sender, board: viewBoard) == true {
                                                                checker.backgroundColor = .blue
                                                            }
                                                            checker.center = CGPoint(
                                                                            x: checkerSquare.frame.height / 2,
                                                                            y: checkerSquare.frame.height / 2)
                                                            for view in viewBoard.subviews {
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
                                                            canStepGray(sender, board: viewBoard)
                                                            canStepWhite(sender, board: viewBoard)
                                                            canStepQueenBlue(sender, board: viewBoard)
                                                            canStepQueenRed(sender, board: viewBoard)
                                                        }
//   MARK: MOVE GRAY BACK
                                                    } else {
                                                        if arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty, (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), currentPlayerMove == .gray,
                                                           checker.backgroundColor == .gray ,
                                                           (view.tag == (checkerSquare.tag + 18)) {
                                                            if view.subviews.isEmpty, view.backgroundColor != .white,  filterNineTop.first?.subviews.first?.backgroundColor == .white || filterNineTop.first?.subviews.first?.backgroundColor == .red {
                                                                filterNineTop.first?.subviews.first?.removeFromSuperview()
                                                                scoreGreyPlayer += 1
                                                                greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                                gameIsFinish()
                                                                view.addSubview(checker)
                                                                if  queenGrayOfCheckers(sender, board: viewBoard) == true {
                                                                    checker.backgroundColor = .blue
                                                                }
                                                                checker.center = CGPoint(
                                                                                x: checkerSquare.frame.height / 2,
                                                                                y: checkerSquare.frame.height / 2)
                                                                for view in viewBoard.subviews {
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
                                                                canStepGray(sender, board: viewBoard)
                                                                canStepWhite(sender, board: viewBoard)
                                                                canStepQueenBlue(sender, board: viewBoard)
                                                                canStepQueenRed(sender, board: viewBoard)
                                                            }
                                                        } else {
                                                            if arrayOfPossibleStepsGray.contains(checkerSquare.tag) || arrayOfPossibleStepsGray.isEmpty, (arrayOfPossibleStepsQueenBlue.contains(checkerSquare.tag) || arrayOfPossibleStepsQueenBlue.isEmpty), currentPlayerMove == .gray,
                                                               checker.backgroundColor == .gray, view.tag == (checkerSquare.tag + 14) {
                                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterSevenTop.first?.subviews.first?.backgroundColor == .white || filterSevenTop.first?.subviews.first?.backgroundColor == .red {
                                                                    filterSevenTop.first?.subviews.first?.removeFromSuperview()
                                                                    scoreGreyPlayer += 1
                                                                    greyPlayerScore.text = "\(scoreGreyPlayer)"
                                                                    gameIsFinish()
                                                                    view.addSubview(checker)
                                                                    if  queenGrayOfCheckers(sender, board: viewBoard) == true {
                                                                        checker.backgroundColor = .blue
                                                                    }
                                                                    checker.center = CGPoint(
                                                                                    x: checkerSquare.frame.height / 2,
                                                                                    y: checkerSquare.frame.height / 2)
                                                                    for view in viewBoard.subviews {
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
                                                                    canStepGray(sender, board: viewBoard)
                                                                    canStepWhite(sender, board: viewBoard)
                                                                    canStepQueenBlue(sender, board: viewBoard)
                                                                    canStepQueenRed(sender, board: viewBoard)
                                                                }
                                                            } else {
                                                                if arrayOfPossibleStepsGray.isEmpty, arrayOfPossibleStepsQueenBlue.isEmpty, currentPlayerMove == .gray, checker.backgroundColor == .gray || checker.backgroundColor == .blue, (view.tag == (checkerSquare.tag - 7) || view.tag == (checkerSquare.tag - 9)) {
                                                                    if view.subviews.isEmpty, view.backgroundColor != .white {
                                                                        view.addSubview(checker)
                                                                        if  queenGrayOfCheckers(sender, board: viewBoard) == true {
                                                                            checker.backgroundColor = .blue
                                                                        }
                                                                        checker.center = CGPoint(
                                                                                        x: checkerSquare.frame.height / 2,
                                                                                        y: checkerSquare.frame.height / 2)
                                                                        for view in viewBoard.subviews {
                                                                            if view.backgroundColor != .white {
                                                                                view.backgroundColor = .black
                                                                                view.layer.borderWidth = 0
                                                                            }
                                                                        }
                                                                        currentPlayerMove = .white
                                                                        movePlayerLabel.text = "moveWhitePlayerLabel_text_startGameVC".localized
                                                                        canStepGray(sender, board: viewBoard)
                                                                        canStepWhite(sender, board: viewBoard)
                                                                        canStepQueenBlue(sender, board: viewBoard)
                                                                        canStepQueenRed(sender, board: viewBoard)
                                                                    } else {
//                                                                        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
//                                                                            checker.center = CGPoint(
//                                                                                            x: checkerSquare.frame.height / 2,
//                                                                                            y: checkerSquare.frame.height / 2)
//                                                                        }
//                                                                        for view in viewBoard.subviews {
//                                                                            if view.backgroundColor != .white {
//                                                                                view.backgroundColor = .black
//                                                                                view.layer.borderWidth = 0
//                                                                            }
//                                                                        }
                                                                    }
                                                                } else {
//                                                                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
//                                                                        checker.center = CGPoint(
//                                                                                        x: checkerSquare.frame.height / 2,
//                                                                                        y: checkerSquare.frame.height / 2)
//                                                                    }
//                                                                    for view in viewBoard.subviews {
//                                                                        if view.backgroundColor != .white {
//                                                                            view.backgroundColor = .black
//                                                                            view.layer.borderWidth = 0
//                                                                        }
//                                                                    }
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
                        } else {
//                            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
                                checker.center = CGPoint(
                                                x: checkerSquare.frame.height / 2,
                                                y: checkerSquare.frame.height / 2)
//                            }
                       }
            }
            default: break
        }
    }
}
