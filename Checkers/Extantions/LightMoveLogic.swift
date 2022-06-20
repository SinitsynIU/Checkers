//
//  Logics.swift
//  Checkers
//
//  Created by Илья Синицын on 16.06.2022.
//

import UIKit

extension StartGameViewController {
    
    func lightMove(_ sender: UILongPressGestureRecognizer) {
        guard let checker = sender.view, let checkerSquare = checker.superview else { return }
        let filterFourTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 4)}
        let filterFiveTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 5)}
        let filterSevenTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 7)}
        let filterNineTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 9)}
        let filterElevenTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 11)}
        let filterFourteenTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 14)}
        let filterEighteenTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 18)}
        let filterNineteenTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 19)}
        let filterTwentyOneTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 21)}
        let filterTwentyTwoTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 22)}
        let filterTwentyThreeTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 23)}
        let filterTwentyFiveTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 25)}
        let filterTwentySevenTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 27)}
        let filterThirtyTwoTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 32)}
        let filterTwentyEightTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 28)}
        let filterTwentyNineTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 29)}
        let filterThirtyFiveTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 35)}
        let filterThirtySixTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 36)}
        let filterThirtySevenTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 37)}
        let filterFortyThreeTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 43)}
        let filterFortyFiveTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 45)}
        let filterFortySixTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 46)}
        let filterFiftyTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 50)}
        let filterFiftyFourTop = viewBoard.subviews.filter{($0.tag == checkerSquare.tag + 54)}
        let filterFourBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 4)}
        let filterFiveBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 5)}
        let filterSevenBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 7)}
        let filterNineBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 9)}
        let filterElevenBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 11)}
        let filterThirteenBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 13)}
        let filterFourteenBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 14)}
        let filterEighteenBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 18)}
        let filterNineteenBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 19)}
        let filterTwentyOneBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 21)}
        let filterTwentyTwoBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 22)}
        let filterTwentyThreeBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 23)}
        let filterTwentyFiveBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 25)}
        let filterTwentyEightBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 28)}
        let filterThirtyTwoBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 32)}
        let filterThirtyFiveBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 35)}
        let filterThirtySixBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 36)}
        let filterThirtySevenBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 37)}
        let filterTwentySevenBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 27)}
        let filterTwentyNineBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 29)}
        let filterFortyThreeBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 43)}
        let filterFortyFiveBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 45)}
        let filterFortySixBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 46)}
        let filterFiftyFourBottom = viewBoard.subviews.filter{($0.tag == checkerSquare.tag - 54)}
        
//MARK: light WHITE (right top)
        for view in viewBoard.subviews {
            if currentPlayerMove == .white, checker.backgroundColor == .white, (view.tag == (checkerSquare.tag + 18)) {
                if view.subviews.isEmpty, view.backgroundColor != .white,
                   filterNineTop.first?.subviews.first?.backgroundColor == .gray {
                    filterSevenTop.first?.layer.borderWidth = 0
                    view.layer.borderColor = UIColor.green.cgColor
                    view.layer.borderWidth = 3
                }
            } else {
                if (view.tag == (checkerSquare.tag + 4)) {
                    if view.subviews.isEmpty, view.backgroundColor != .white,
                        filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                        filterFourTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .gray && filterElevenTop.first?.subviews.first?.backgroundColor == .gray {
                        view.layer.borderColor = UIColor.green.cgColor
                        view.layer.borderWidth = 3
                    }
                } else {
                    if (view.tag == (checkerSquare.tag + 32)) {
                        if view.subviews.isEmpty, view.backgroundColor != .white,
                            filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtyTwoTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .gray && filterTwentyFiveTop.first?.subviews.first?.backgroundColor == .gray {
                            view.layer.borderColor = UIColor.green.cgColor
                            view.layer.borderWidth = 3
                        }
                    }  else {
                        if (view.tag == (checkerSquare.tag + 36)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white,
                                filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .gray && filterTwentySevenTop.first?.subviews.first?.backgroundColor == .gray  {
                                view.layer.borderColor = UIColor.green.cgColor
                                view.layer.borderWidth = 3
                            }
                        }  else {
                            if (view.tag == (checkerSquare.tag + 54)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                    filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyFourTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .gray && filterTwentySevenTop.first?.subviews.first?.backgroundColor == .gray && filterFortyFiveTop.first?.subviews.first?.backgroundColor == .gray  {
                                    view.layer.borderColor = UIColor.green.cgColor
                                    view.layer.borderWidth = 3
                                }
                    } else {
                        if (view.tag == (checkerSquare.tag + 22)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white,
                                filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyTwoTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .gray && filterTwentySevenTop.first?.subviews.first?.backgroundColor == .gray && filterTwentyNineTop.first?.subviews.first?.backgroundColor == .gray  {
                                    view.layer.borderColor = UIColor.green.cgColor
                                    view.layer.borderWidth = 3
                            }
                    } else {
                        if (view.tag == (checkerSquare.tag + 50)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white,
                                filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .gray && filterTwentySevenTop.first?.subviews.first?.backgroundColor == .gray && filterFortyThreeTop.first?.subviews.first?.backgroundColor == .gray  {
                                    view.layer.borderColor = UIColor.green.cgColor
                                    view.layer.borderWidth = 3
                            }
//MARK: light WHITE (left top)
                    } else {
                        if currentPlayerMove == .white, checker.backgroundColor == .white, (view.tag == (checkerSquare.tag + 14)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white,
                                filterSevenTop.first?.subviews.first?.backgroundColor == .gray {
                                filterNineTop.first?.layer.borderWidth = 0
                                view.layer.borderColor = UIColor.green.cgColor
                                view.layer.borderWidth = 3
                            }
                        } else {
                            if (view.tag == (checkerSquare.tag + 28)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                    filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterSevenTop.first?.subviews.first?.backgroundColor == .gray && filterTwentyOneTop.first?.subviews.first?.backgroundColor == .gray {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                }
                            } else {
                                if (view.tag == (checkerSquare.tag + 42)) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && filterSevenTop.first?.subviews.first?.backgroundColor == .gray && filterTwentyOneTop.first?.subviews.first?.backgroundColor == .gray && filterThirtyFiveTop.first?.subviews.first?.backgroundColor == .gray {
                                            view.layer.borderColor = UIColor.green.cgColor
                                            view.layer.borderWidth = 3
                                    }
                                } else {
                                    if (view.tag == (checkerSquare.tag - 4)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterSevenTop.first?.subviews.first?.backgroundColor == .gray && filterFiveTop.first?.subviews.first?.backgroundColor == .gray {
                                                view.layer.borderColor = UIColor.green.cgColor
                                                view.layer.borderWidth = 3
                                        }
                        } else {
                            if (view.tag == (checkerSquare.tag + 10)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                    filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                    filterSevenTop.first?.subviews.first?.backgroundColor == .gray &&
                                    filterTwentyOneTop.first?.subviews.first?.backgroundColor == .gray &&
                                    filterNineteenTop.first?.subviews.first?.backgroundColor == .gray {
                                            view.layer.borderColor = UIColor.green.cgColor
                                            view.layer.borderWidth = 3
                                }
                            } else {
                                if (view.tag == (checkerSquare.tag + 32)) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterThirtyTwoTop.first(where: {$0.subviews.isEmpty}) != nil && filterSevenTop.first?.subviews.first?.backgroundColor == .gray && filterTwentyThreeTop.first?.subviews.first?.backgroundColor == .gray {
                                            view.layer.borderColor = UIColor.green.cgColor
                                            view.layer.borderWidth = 3
                                    }
                            } else {
                                if (view.tag == (checkerSquare.tag + 46)) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && filterFortySixTop.first(where: {$0.subviews.isEmpty}) != nil && filterSevenTop.first?.subviews.first?.backgroundColor == .gray && filterTwentyOneTop.first?.subviews.first?.backgroundColor == .gray && filterThirtySevenTop.first?.subviews.first?.backgroundColor == .gray {
                                            view.layer.borderColor = UIColor.green.cgColor
                                            view.layer.borderWidth = 3
                                    }
//MARK: light WHITE (right bottom)
                            } else {
                                if currentPlayerMove == .white, checker.backgroundColor == .white, (view.tag == (checkerSquare.tag - 18)) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white,
                                        filterNineBottom.first?.subviews.first?.backgroundColor == .gray {
                                            filterSevenBottom.first?.layer.borderWidth = 0
                                            view.layer.borderColor = UIColor.green.cgColor
                                            view.layer.borderWidth = 3
                                    }
                        } else {
                            if (view.tag == (checkerSquare.tag - 4)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                    filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&  filterFourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .gray && filterElevenBottom.first?.subviews.first?.backgroundColor == .gray {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                }
                        } else {
                            if (view.tag == (checkerSquare.tag - 32)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                    filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentyFiveBottom.first?.subviews.first?.backgroundColor == .gray  {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                }
                        } else {
                            if (view.tag == (checkerSquare.tag - 36)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                    filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentySevenBottom.first?.subviews.first?.backgroundColor == .gray  {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                }
                        } else {
                            if (view.tag == (checkerSquare.tag - 54)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,  filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyFourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentySevenBottom.first?.subviews.first?.backgroundColor == .gray && filterFortyFiveBottom.first?.subviews.first?.backgroundColor == .gray {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                }
                    } else {
                        if (view.tag == (checkerSquare.tag - 22)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white,
                                filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentySevenBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentyNineBottom.first?.subviews.first?.backgroundColor == .gray {
                                    view.layer.borderColor = UIColor.green.cgColor
                                    view.layer.borderWidth = 3
                            }
                        } else {
                            if (view.tag == (checkerSquare.tag - 22)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                    filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterFourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil && filterSevenTop.first?.subviews.first?.backgroundColor == .gray && filterFiveTop.first?.subviews.first?.backgroundColor == .gray && filterThirteenBottom.first?.subviews.first?.backgroundColor == .gray {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                }
                    } else {
                        if (view.tag == (checkerSquare.tag - 50)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white,
                                filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyFourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentySevenBottom.first?.subviews.first?.backgroundColor == .gray && filterFortyThreeBottom.first?.subviews.first?.backgroundColor == .gray {
                                    view.layer.borderColor = UIColor.green.cgColor
                                    view.layer.borderWidth = 3
                            }
//MARK: light WHITE (left bottom)
                        } else {
                            if currentPlayerMove == .white, checker.backgroundColor == .white, (view.tag == (checkerSquare.tag - 14)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                   filterSevenBottom.first?.subviews.first?.backgroundColor == .gray {
                                    filterNineBottom.first?.layer.borderWidth = 0
                                    view.layer.borderColor = UIColor.green.cgColor
                                    view.layer.borderWidth = 3
                                }
                        } else {
                            if (view.tag == (checkerSquare.tag - 28)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                    filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterSevenBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .gray {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                    }
                        } else {
                            if (view.tag == (checkerSquare.tag - 42)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                    filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && filterSevenBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .gray && filterThirtyFiveBottom.first?.subviews.first?.backgroundColor == .gray {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                }
                            } else {
                                if (view.tag == (checkerSquare.tag + 4)) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterFourteenBottom.first?.backgroundColor != .white &&  filterSevenBottom.first?.subviews.first?.backgroundColor == .gray && filterFiveBottom.first?.subviews.first?.backgroundColor == .gray {
                                            view.layer.borderColor = UIColor.green.cgColor
                                            view.layer.borderWidth = 3
                                    }
                    } else {
                        if (view.tag == (checkerSquare.tag - 10)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white,
                                filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                filterSevenBottom.first?.subviews.first?.backgroundColor == .gray &&
                                filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .gray &&
                                filterNineteenBottom.first?.subviews.first?.backgroundColor == .gray {
                                    view.layer.borderColor = UIColor.green.cgColor
                                    view.layer.borderWidth = 3
                            }
                        } else {
                            if (view.tag == (checkerSquare.tag - 32)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                    filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                    filterSevenBottom.first?.subviews.first?.backgroundColor == .gray &&
                                    filterTwentyThreeBottom.first?.subviews.first?.backgroundColor == .gray {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                }
                        } else {
                            if (view.tag == (checkerSquare.tag - 46)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,  filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                    filterFortySixBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                    filterSevenBottom.first?.subviews.first?.backgroundColor == .gray &&
                                    filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .gray &&
                                    filterThirtySevenBottom.first?.subviews.first?.backgroundColor == .gray {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                }
                } else {
                    if currentPlayerMove == .white, checker.backgroundColor == .white, view.tag == (checkerSquare.tag + 7) {
                        if view.backgroundColor != .white, view.subviews.isEmpty,
                            ((filterFourteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterSevenBottom.first?.subviews.first?.backgroundColor != .gray) || filterSevenBottom.first(where: {$0.subviews.isEmpty}) != nil) &&
                                ((filterEighteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterNineBottom.first?.subviews.first?.backgroundColor != .gray) || filterNineBottom.first(where: {$0.subviews.isEmpty}) != nil) &&
                                    ((filterEighteenTop.first(where: {$0.subviews.isEmpty}) == nil || filterNineTop.first?.subviews.first?.backgroundColor != .gray) || filterEighteenTop.first?.backgroundColor == .gray ||
                                     filterNineTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                            view.layer.borderColor = UIColor.green.cgColor
                                            view.layer.borderWidth = 3
                        }
                    } else {
                        if currentPlayerMove == .white, checker.backgroundColor == .white, view.tag == (checkerSquare.tag + 9) {
                            if view.backgroundColor != .white, view.subviews.isEmpty,
                                ((filterEighteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterNineBottom.first?.subviews.first?.backgroundColor != .gray) || filterNineBottom.first(where: {$0.subviews.isEmpty}) != nil) &&
                                    (filterFourteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterSevenBottom.first?.subviews.first?.backgroundColor != .gray || filterSevenBottom.first(where: {$0.subviews.isEmpty}) != nil) &&
                                        ((filterFourteenTop.first(where: {$0.subviews.isEmpty}) == nil || filterSevenTop.first?.subviews.first?.backgroundColor != .gray || filterFourteenTop.first?.backgroundColor == .gray) || filterSevenTop.first(where: {$0.subviews.isEmpty}) != nil)  {
                                                view.layer.borderColor = UIColor.green.cgColor
                                                view.layer.borderWidth = 3
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
                    }
                }
            }
        }
// MARK: light GREY (right bottom)
        for view in viewBoard.subviews {
            if currentPlayerMove == .gray, checker.backgroundColor == .gray, (view.tag == (checkerSquare.tag + 18)) {
                if view.subviews.isEmpty, view.backgroundColor != .white,
                   filterNineTop.first?.subviews.first?.backgroundColor == .white {
                    filterSevenTop.first?.layer.borderWidth = 0
                        view.layer.borderColor = UIColor.green.cgColor
                        view.layer.borderWidth = 3
                }
            } else {
                if (view.tag == (checkerSquare.tag + 4)) {
                    if view.subviews.isEmpty, view.backgroundColor != .white,
                        filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                        filterFourTop.first(where: {$0.subviews.isEmpty}) != nil && filterSevenBottom.first?.subviews.first?.backgroundColor == .white && filterFiveBottom.first?.subviews.first?.backgroundColor == .white {
                            view.layer.borderColor = UIColor.green.cgColor
                            view.layer.borderWidth = 3
                    }
                } else {
                    if (view.tag == (checkerSquare.tag + 32)) {
                        if view.subviews.isEmpty, view.backgroundColor != .white,
                            filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtyTwoTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .white && filterTwentyFiveTop.first?.subviews.first?.backgroundColor == .white {
                                view.layer.borderColor = UIColor.green.cgColor
                                view.layer.borderWidth = 3
                        }
                    }  else {
                        if (view.tag == (checkerSquare.tag + 36)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white,
                                filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .white && filterTwentySevenTop.first?.subviews.first?.backgroundColor == .white  {
                                    view.layer.borderColor = UIColor.green.cgColor
                                    view.layer.borderWidth = 3
                            }
                        }  else {
                            if (view.tag == (checkerSquare.tag + 54)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                    filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyFourTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .white && filterTwentySevenTop.first?.subviews.first?.backgroundColor == .white && filterFortyFiveTop.first?.subviews.first?.backgroundColor == .white  {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                }
                            } else {
                                if (view.tag == (checkerSquare.tag + 22)) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyTwoTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .white && filterTwentySevenTop.first?.subviews.first?.backgroundColor == .white && filterTwentyNineTop.first?.subviews.first?.backgroundColor == .white  {
                                            view.layer.borderColor = UIColor.green.cgColor
                                            view.layer.borderWidth = 3
                                    }
                                } else {
                                    if (view.tag == (checkerSquare.tag + 50)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white,  filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .white && filterTwentySevenTop.first?.subviews.first?.backgroundColor == .white && filterFortyThreeTop.first?.subviews.first?.backgroundColor == .white {
                                                view.layer.borderColor = UIColor.green.cgColor
                                                view.layer.borderWidth = 3
                                        }
//MARK: light GREY (left bottom)
                                    } else  {
                                        if currentPlayerMove == .gray, checker.backgroundColor == .gray, (view.tag == (checkerSquare.tag + 14)) {
                                            if view.subviews.isEmpty, view.backgroundColor != .white,
                                               filterSevenTop.first?.subviews.first?.backgroundColor == .white {
                                                    filterNineTop.first?.layer.borderWidth = 0
                                                    view.layer.borderColor = UIColor.green.cgColor
                                                    view.layer.borderWidth = 3
                                            }
                                        } else {
                                            if (view.tag == (checkerSquare.tag + 28)) {
                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterSevenTop.first?.subviews.first?.backgroundColor == .white && filterTwentyOneTop.first?.subviews.first?.backgroundColor == .white {
                                                        view.layer.borderColor = UIColor.green.cgColor
                                                        view.layer.borderWidth = 3
                                                }
                                            } else {
                                                if (view.tag == (checkerSquare.tag + 42)) {
                                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && filterSevenTop.first?.subviews.first?.backgroundColor == .white && filterTwentyOneTop.first?.subviews.first?.backgroundColor == .white && filterThirtyFiveTop.first?.subviews.first?.backgroundColor == .white  {
                                                            view.layer.borderColor = UIColor.green.cgColor
                                                            view.layer.borderWidth = 3
                                                    }
                                                } else {
                                                    if (view.tag == (checkerSquare.tag - 4)) {
                                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterSevenTop.first?.subviews.first?.backgroundColor == .white &&  filterFiveTop.first?.subviews.first?.backgroundColor == .white  {
                                                                view.layer.borderColor = UIColor.green.cgColor
                                                                view.layer.borderWidth = 3
                                                        }
                                                    } else {
                                                        if (view.tag == (checkerSquare.tag + 10)) {
                                                            if view.subviews.isEmpty, view.backgroundColor != .white,  filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                filterTwentyEightTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                filterSevenTop.first?.subviews.first?.backgroundColor == .white &&
                                                                filterTwentyOneTop.first?.subviews.first?.backgroundColor == .white &&
                                                                filterNineteenTop.first?.subviews.first?.backgroundColor == .white {
                                                                    view.layer.borderColor = UIColor.green.cgColor
                                                                    view.layer.borderWidth = 3
                                                            }
                                                        } else {
                                                            if (view.tag == (checkerSquare.tag + 32)) {
                                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterThirtyTwoTop.first(where: {$0.subviews.isEmpty}) != nil && filterSevenTop.first?.subviews.first?.backgroundColor == .white &&
                                                                    filterTwentyThreeTop.first?.subviews.first?.backgroundColor == .white {
                                                                        view.layer.borderColor = UIColor.green.cgColor
                                                                        view.layer.borderWidth = 3
                                                                }
                                                            } else {
                                                                if (view.tag == (checkerSquare.tag + 46)) {
                                                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                        filterFortySixTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                        filterSevenTop.first?.subviews.first?.backgroundColor == .white &&
                                                                        filterTwentyOneTop.first?.subviews.first?.backgroundColor == .white &&
                                                                        filterThirtySevenTop.first?.subviews.first?.backgroundColor == .white {
                                                                            view.layer.borderColor = UIColor.green.cgColor
                                                                            view.layer.borderWidth = 3
                                                                    }
//MARK: light GREY (right top)
                                        } else {
                                            if currentPlayerMove == .gray, checker.backgroundColor == .gray, (view.tag == (checkerSquare.tag - 18)) {
                                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                                   filterNineBottom.first?.subviews.first?.backgroundColor == .white {
                                                    filterSevenBottom.first?.layer.borderWidth = 0
                                                    view.layer.borderColor = UIColor.green.cgColor
                                                    view.layer.borderWidth = 3
                                                }
                                            } else {
                                                if (view.tag == (checkerSquare.tag - 4)) {
                                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&  filterFourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .white && filterElevenBottom.first?.subviews.first?.backgroundColor == .white  {
                                                            view.layer.borderColor = UIColor.green.cgColor
                                                            view.layer.borderWidth = 3
                                                    }
                                                } else {
                                                    if (view.tag == (checkerSquare.tag - 32)) {
                                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .white && filterTwentyFiveBottom.first?.subviews.first?.backgroundColor == .white  {
                                                                view.layer.borderColor = UIColor.green.cgColor
                                                                view.layer.borderWidth = 3
                                                        }
                                                    } else {
                                                        if (view.tag == (checkerSquare.tag - 36)) {
                                                            if view.subviews.isEmpty, view.backgroundColor != .white,  filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                filterThirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .white && filterTwentySevenBottom.first?.subviews.first?.backgroundColor == .white  {
                                                                    view.layer.borderColor = UIColor.green.cgColor
                                                                    view.layer.borderWidth = 3
                                                            }
                                                        } else {
                                                            if (view.tag == (checkerSquare.tag - 54)) {
                                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyFourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .white && filterTwentySevenBottom.first?.subviews.first?.backgroundColor == .white && filterFortyFiveBottom.first?.subviews.first?.backgroundColor == .white  {
                                                                        view.layer.borderColor = UIColor.green.cgColor
                                                                        view.layer.borderWidth = 3
                                                                }
                                                            } else {
                                                                if (view.tag == (checkerSquare.tag - 22)) {
                                                                    if view.subviews.isEmpty, view.backgroundColor != .white,
                                                                        filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .white && filterTwentySevenBottom.first?.subviews.first?.backgroundColor == .white && filterTwentyNineBottom.first?.subviews.first?.backgroundColor == .white {
                                                                            view.layer.borderColor = UIColor.green.cgColor
                                                                            view.layer.borderWidth = 3
                                                                    }
                                } else {
                                    if (view.tag == (checkerSquare.tag - 50)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white,  filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyFourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .white && filterTwentySevenBottom.first?.subviews.first?.backgroundColor == .white && filterFortyThreeBottom.first?.subviews.first?.backgroundColor == .white  {
                                                view.layer.borderColor = UIColor.green.cgColor
                                                view.layer.borderWidth = 3
                                        }
//MARK: light GREY (left top)
                                } else {
                                    if currentPlayerMove == .gray, checker.backgroundColor == .gray, (view.tag == (checkerSquare.tag - 14)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white,
                                           filterSevenBottom.first?.subviews.first?.backgroundColor == .white {
                                                filterNineBottom.first?.layer.borderWidth = 0
                                                view.layer.borderColor = UIColor.green.cgColor
                                                view.layer.borderWidth = 3
                                                    }
                                } else {
                                    if (view.tag == (checkerSquare.tag - 28)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterSevenBottom.first?.subviews.first?.backgroundColor == .white && filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .white {
                                                view.layer.borderColor = UIColor.green.cgColor
                                                view.layer.borderWidth = 3
                                        }
                                } else {
                                    if (view.tag == (checkerSquare.tag - 42)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && filterSevenBottom.first?.subviews.first?.backgroundColor == .white && filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .white && filterThirtyFiveBottom.first?.subviews.first?.backgroundColor == .white  {
                                                view.layer.borderColor = UIColor.green.cgColor
                                                view.layer.borderWidth = 3
                                        }
                                } else {
                                    if (view.tag == (checkerSquare.tag + 4)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&  filterSevenBottom.first?.subviews.first?.backgroundColor == .white &&  filterFiveBottom.first?.subviews.first?.backgroundColor == .white  {
                                                view.layer.borderColor = UIColor.green.cgColor
                                                view.layer.borderWidth = 3
                                        }
                                } else {
                                    if (view.tag == (checkerSquare.tag - 10)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                            filterSevenBottom.first?.subviews.first?.backgroundColor == .white &&
                                            filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .white && filterNineteenBottom.first?.subviews.first?.backgroundColor == .white {
                                                    view.layer.borderColor = UIColor.green.cgColor
                                                    view.layer.borderWidth = 3
                                        }
                                } else {
                                    if (view.tag == (checkerSquare.tag - 32)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                            filterSevenBottom.first?.subviews.first?.backgroundColor == .white &&
                                            filterTwentyThreeBottom.first?.subviews.first?.backgroundColor == .white {
                                                view.layer.borderColor = UIColor.green.cgColor
                                                view.layer.borderWidth = 3
                                        }
                                } else {
                                    if (view.tag == (checkerSquare.tag - 46)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white,  filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                            filterFortySixBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                            filterSevenBottom.first?.subviews.first?.backgroundColor == .white &&
                                            filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .white &&
                                            filterThirtySevenBottom.first?.subviews.first?.backgroundColor == .white {
                                                view.layer.borderColor = UIColor.green.cgColor
                                                view.layer.borderWidth = 3
                                        }
                                } else {
                                    if currentPlayerMove == .gray, checker.backgroundColor == .gray, view.tag == (checkerSquare.tag - 7) {
                                        if view.backgroundColor != .white, view.subviews.isEmpty,
                                           ((filterFourteenTop.first(where: {$0.subviews.isEmpty}) == nil ||
                                        filterSevenTop.first?.subviews.first?.backgroundColor != .white) ||
                                            filterSevenTop.first(where: {$0.subviews.isEmpty}) != nil) &&
                                        ((filterEighteenBottom.first(where: {$0.subviews.isEmpty}) == nil ||
                                        filterNineBottom.first?.subviews.first?.backgroundColor != .white) ||
                                         filterNineBottom.first(where: {$0.subviews.isEmpty}) != nil || filterEighteenBottom.first?.backgroundColor == .white) &&
                                            ((filterEighteenTop.first(where: {$0.subviews.isEmpty}) == nil ||
                                            filterNineTop.first?.subviews.first?.backgroundColor != .white) ||
                                             filterNineTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                            view.layer.borderColor = UIColor.green.cgColor
                                                            view.layer.borderWidth = 3
                                        }
                                } else {
                                    if currentPlayerMove == .gray, checker.backgroundColor == .gray, view.tag == (checkerSquare.tag - 9) {
                                        if view.backgroundColor != .white, view.subviews.isEmpty, ((filterEighteenTop.first(where: {$0.subviews.isEmpty}) == nil || filterNineTop.first?.subviews.first?.backgroundColor != .white) ||
                                            filterNineTop.first(where: {$0.subviews.isEmpty}) != nil) &&
                                        ((filterFourteenBottom.first(where: {$0.subviews.isEmpty}) == nil ||
                                        filterSevenBottom.first?.subviews.first?.backgroundColor != .white) ||
                                        filterSevenBottom.first(where: {$0.subviews.isEmpty}) != nil) &&
                                    ((filterFourteenTop.first(where: {$0.subviews.isEmpty}) == nil ||
                                      filterSevenTop.first?.subviews.first?.backgroundColor != .white) ||
                                                 filterSevenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                        view.layer.borderColor = UIColor.green.cgColor
                                                        view.layer.borderWidth = 3
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
                    }
                }
            }
        }
        }
    }
}
