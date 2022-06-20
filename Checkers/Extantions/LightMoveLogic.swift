//
//  Game.swift
//  Checkers
//
//  Created by mac on 13.06.22.
//

import Foundation
import UIKit

extension StartGameViewController {
    
    func backlight(gesture: UIPanGestureRecognizer) {
        guard let checker = gesture.view, let view_ch = checker.superview else {return}
        let filterFourTop = board.subviews.filter{($0.tag == view_ch.tag + 4)}
        let filterFiveTop = board.subviews.filter{($0.tag == view_ch.tag + 5)}
        let filterSevenTop = board.subviews.filter{($0.tag == view_ch.tag + 7)}
        let filterNineTop = board.subviews.filter{($0.tag == view_ch.tag + 9)}
        let filterElevenTop = board.subviews.filter{($0.tag == view_ch.tag + 11)}
        let filterFourteenTop = board.subviews.filter{($0.tag == view_ch.tag + 14)}
        let filterEighteenTop = board.subviews.filter{($0.tag == view_ch.tag + 18)}
        let filterNineteenTop = board.subviews.filter{($0.tag == view_ch.tag + 19)}
        let filterTwentyOneTop = board.subviews.filter{($0.tag == view_ch.tag + 21)}
        let filterTwentytwoTop = board.subviews.filter{($0.tag == view_ch.tag + 22)}
        let filterTwentythreeTop = board.subviews.filter{($0.tag == view_ch.tag + 23)}
        let filterTwentyfiveTop = board.subviews.filter{($0.tag == view_ch.tag + 25)}
        let filterTwentysevenTop = board.subviews.filter{($0.tag == view_ch.tag + 27)}
        let filterThirtytwoTop = board.subviews.filter{($0.tag == view_ch.tag + 32)}
        let filterTwentyEightTop = board.subviews.filter{($0.tag == view_ch.tag + 28)}
        let filterTwentyNineTop = board.subviews.filter{($0.tag == view_ch.tag + 29)}
        let filterThirtyFiveTop = board.subviews.filter{($0.tag == view_ch.tag + 35)}
        let filterThirtysixTop = board.subviews.filter{($0.tag == view_ch.tag + 36)}
        let filterThirtysevenTop = board.subviews.filter{($0.tag == view_ch.tag + 37)}
        let filterFortythreeTop = board.subviews.filter{($0.tag == view_ch.tag + 43)}
        let filterFortyFiveTop = board.subviews.filter{($0.tag == view_ch.tag + 45)}
        let filterFortysixTop = board.subviews.filter{($0.tag == view_ch.tag + 46)}
        let filterFiftyTop = board.subviews.filter{($0.tag == view_ch.tag + 50)}
        let filterFiftyfourTop = board.subviews.filter{($0.tag == view_ch.tag + 54)}
        let filterFourBottom = board.subviews.filter{($0.tag == view_ch.tag - 4)}
        let filterFiveBottom = board.subviews.filter{($0.tag == view_ch.tag - 5)}
        let filterSevenBottom = board.subviews.filter{($0.tag == view_ch.tag - 7)}
        let filterNineBottom = board.subviews.filter{($0.tag == view_ch.tag - 9)}
        let filterElevenBottom = board.subviews.filter{($0.tag == view_ch.tag - 11)}
        let filterThirteenBottom = board.subviews.filter{($0.tag == view_ch.tag - 13)}
        let filterFourteenBottom = board.subviews.filter{($0.tag == view_ch.tag - 14)}
        let filterEighteenBottom = board.subviews.filter{($0.tag == view_ch.tag - 18)}
        let filterNineteenBottom = board.subviews.filter{($0.tag == view_ch.tag - 19)}
        let filterTwentyOneBottom = board.subviews.filter{($0.tag == view_ch.tag - 21)}
        let filterTwentytwoBottom = board.subviews.filter{($0.tag == view_ch.tag - 22)}
        let filterTwentythreeBottom = board.subviews.filter{($0.tag == view_ch.tag - 23)}
        let filterTwentyfiveBottom = board.subviews.filter{($0.tag == view_ch.tag - 25)}
        let filterTwentyEightBottom = board.subviews.filter{($0.tag == view_ch.tag - 28)}
        let filterThirtytwoBottom = board.subviews.filter{($0.tag == view_ch.tag - 32)}
        let filterThirtyfiveBottom = board.subviews.filter{($0.tag == view_ch.tag - 35)}
        let filterThirtysixBottom = board.subviews.filter{($0.tag == view_ch.tag - 36)}
        let filterThirtysevenBottom = board.subviews.filter{($0.tag == view_ch.tag - 37)}
        let filterTwentysevenBottom = board.subviews.filter{($0.tag == view_ch.tag - 27)}
        let filterTwentyNineBottom = board.subviews.filter{($0.tag == view_ch.tag - 29)}
        let filterFortythreeBottom = board.subviews.filter{($0.tag == view_ch.tag - 43)}
        let filterFortyFiveBottom = board.subviews.filter{($0.tag == view_ch.tag - 45)}
        let filterFortysixBottom = board.subviews.filter{($0.tag == view_ch.tag - 46)}
        let filterFiftyfourBottom = board.subviews.filter{($0.tag == view_ch.tag - 54)}
        
        //MARK: backlight GRAY (right top)
        for view in board.subviews {
            if checker.backgroundColor == .gray, (view.tag == (view_ch.tag + 18)) {
                if view.subviews.isEmpty, view.backgroundColor != .white,
                   filterNineTop.first?.subviews.first?.backgroundColor == .white {
                    filterSevenTop.first?.layer.borderWidth = 0
                    view.layer.borderColor = UIColor.green.cgColor
                    view.layer.borderWidth = 3
                }
            } else {
                if (view.tag == (view_ch.tag + 4)) {
                    if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterFourTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .white && filterElevenTop.first?.subviews.first?.backgroundColor == .white {
                        view.layer.borderColor = UIColor.green.cgColor
                        view.layer.borderWidth = 3
                    }
                } else {
                    if (view.tag == (view_ch.tag + 32)) {
                        if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtytwoTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .white && filterTwentyfiveTop.first?.subviews.first?.backgroundColor == .white {
                            view.layer.borderColor = UIColor.green.cgColor
                            view.layer.borderWidth = 3
                        }
                    }  else {
                        if (view.tag == (view_ch.tag + 36)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtysixTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .white && filterTwentysevenTop.first?.subviews.first?.backgroundColor == .white  {
                                view.layer.borderColor = UIColor.green.cgColor
                                view.layer.borderWidth = 3
                            }
                        }  else {
                            if (view.tag == (view_ch.tag + 54)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtysixTop.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyfourTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .white && filterTwentysevenTop.first?.subviews.first?.backgroundColor == .white && filterFortyFiveTop.first?.subviews.first?.backgroundColor == .white  {
                                    view.layer.borderColor = UIColor.green.cgColor
                                    view.layer.borderWidth = 3
                                }
                            } else {
                                if (view.tag == (view_ch.tag + 22)) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtysixTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentytwoTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .white && filterTwentysevenTop.first?.subviews.first?.backgroundColor == .white && filterTwentyNineTop.first?.subviews.first?.backgroundColor == .white  {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                    }
                                } else {
                                    if (view.tag == (view_ch.tag + 50)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white,  filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtysixTop.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .white && filterTwentysevenTop.first?.subviews.first?.backgroundColor == .white && filterFortythreeTop.first?.subviews.first?.backgroundColor == .white  {
                                            view.layer.borderColor = UIColor.green.cgColor
                                            view.layer.borderWidth = 3
                                        }
//MARK: backlight GRAY (left top)
                    } else {
                        if checker.backgroundColor == .gray, (view.tag == (view_ch.tag + 14)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white,
                                filterSevenTop.first?.subviews.first?.backgroundColor == .white {
                                filterNineTop.first?.layer.borderWidth = 0
                                view.layer.borderColor = UIColor.green.cgColor
                                view.layer.borderWidth = 3
                                            }
                                        } else {
                                            if (view.tag == (view_ch.tag + 28)) {
                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterSevenTop.first?.subviews.first?.backgroundColor == .white && filterTwentyOneTop.first?.subviews.first?.backgroundColor == .white {
                                                    view.layer.borderColor = UIColor.green.cgColor
                                                    view.layer.borderWidth = 3
                                                }
                                            } else {
                                                if (view.tag == (view_ch.tag + 42)) {
                                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && filterSevenTop.first?.subviews.first?.backgroundColor == .white && filterTwentyOneTop.first?.subviews.first?.backgroundColor == .white && filterThirtyFiveTop.first?.subviews.first?.backgroundColor == .white  {
                                                        view.layer.borderColor = UIColor.green.cgColor
                                                        view.layer.borderWidth = 3
                                                    }
                                                } else {
                                                    if (view.tag == (view_ch.tag - 4)) {
                                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterSevenTop.first?.subviews.first?.backgroundColor == .white && filterFiveTop.first?.subviews.first?.backgroundColor == .white  {
                                                            view.layer.borderColor = UIColor.green.cgColor
                                                            view.layer.borderWidth = 3
                                                        }
                                                    } else {
                                                        if (view.tag == (view_ch.tag + 10)) {
                                                            if view.subviews.isEmpty, view.backgroundColor != .white,  filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                filterSevenTop.first?.subviews.first?.backgroundColor == .white &&
                                                                filterTwentyOneTop.first?.subviews.first?.backgroundColor == .white &&
                                                                filterNineteenTop.first?.subviews.first?.backgroundColor == .white {
                                                                view.layer.borderColor = UIColor.green.cgColor
                                                                view.layer.borderWidth = 3
                                                            }
                                                        }
                                                        else {
                                                            if (view.tag == (view_ch.tag + 32)) {
                                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterThirtytwoTop.first(where: {$0.subviews.isEmpty}) != nil && filterSevenTop.first?.subviews.first?.backgroundColor == .white && filterTwentythreeTop.first?.subviews.first?.backgroundColor == .white {
                                                                    view.layer.borderColor = UIColor.green.cgColor
                                                                    view.layer.borderWidth = 3
                                                                }
                                                            } else {
                                                                if (view.tag == (view_ch.tag + 46)) {
                                                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                        filterFortysixTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                        filterSevenTop.first?.subviews.first?.backgroundColor == .white &&
                                                                        filterTwentyOneTop.first?.subviews.first?.backgroundColor == .white &&
                                                                        filterThirtysevenTop.first?.subviews.first?.backgroundColor == .white {
                                                                        view.layer.borderColor = UIColor.green.cgColor
                                                                        view.layer.borderWidth = 3
                                                                    }
                                                                    //MARK: backlight GRAY (right bottom)
                                                                } else {
                                                                    if checker.backgroundColor == .gray, (view.tag == (view_ch.tag - 18)) {
                                                                        if view.subviews.isEmpty, view.backgroundColor != .white,
                                                                           filterNineBottom.first?.subviews.first?.backgroundColor == .white {
                                                                            filterSevenBottom.first?.layer.borderWidth = 0
                                                                            view.layer.borderColor = UIColor.green.cgColor
                                                                            view.layer.borderWidth = 3
                                                                        }
                                                                    } else {
                                                                        if (view.tag == (view_ch.tag - 4)) {
                                                                            if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&  filterFourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .white && filterElevenBottom.first?.subviews.first?.backgroundColor == .white  {
                                                                                view.layer.borderColor = UIColor.green.cgColor
                                                                                view.layer.borderWidth = 3
                                                                            }
                                                                        } else {
                                                                            if (view.tag == (view_ch.tag - 32)) {
                                                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtytwoBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .white && filterTwentyfiveBottom.first?.subviews.first?.backgroundColor == .white  {
                                                                                    view.layer.borderColor = UIColor.green.cgColor
                                                                                    view.layer.borderWidth = 3
                                                                                }
                                                                            }  else {
                                                                                if (view.tag == (view_ch.tag - 36)) {
                                                                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtysixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .white && filterTwentysevenBottom.first?.subviews.first?.backgroundColor == .white  {
                                                                                        view.layer.borderColor = UIColor.green.cgColor
                                                                                        view.layer.borderWidth = 3
                                                                                    }
                                                                                }  else {
                                                                                    if (view.tag == (view_ch.tag - 54)) {
                                                                                        if view.subviews.isEmpty, view.backgroundColor != .white,  filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtysixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyfourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .white && filterTwentysevenBottom.first?.subviews.first?.backgroundColor == .white && filterFortyFiveBottom.first?.subviews.first?.backgroundColor == .white  {
                                                                                            view.layer.borderColor = UIColor.green.cgColor
                                                                                            view.layer.borderWidth = 3
                                                                                        }
                                            } else {
                                                if (view.tag == (view_ch.tag - 22)) {
                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtysixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentytwoBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .white && filterTwentysevenBottom.first?.subviews.first?.backgroundColor == .white && filterTwentyNineBottom.first?.subviews.first?.backgroundColor == .white {
                                                        view.layer.borderColor = UIColor.green.cgColor
                                                        view.layer.borderWidth = 3
                                                                        }
                                                } else {
                                                    if (view.tag == (view_ch.tag - 22)) {
                                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterFourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentytwoBottom.first(where: {$0.subviews.isEmpty}) != nil && filterSevenTop.first?.subviews.first?.backgroundColor == .white && filterFiveTop.first?.subviews.first?.backgroundColor == .white && filterThirteenBottom.first?.subviews.first?.backgroundColor == .white {
                                                            view.layer.borderColor = UIColor.green.cgColor
                                                            view.layer.borderWidth = 3
                                                                            
                                                    }
                                                } else {
                                                                    if (view.tag == (view_ch.tag - 50)) {
                                                                    if view.subviews.isEmpty, view.backgroundColor != .white,  filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtysixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyfourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .white && filterTwentysevenBottom.first?.subviews.first?.backgroundColor == .white && filterFortythreeBottom.first?.subviews.first?.backgroundColor == .white  {
                                                                                                    view.layer.borderColor = UIColor.green.cgColor
                                                                                                    view.layer.borderWidth = 3
                                                                                                }
  //MARK: backlight GRAY (left bottom)
                        } else {
                            if checker.backgroundColor == .gray, (view.tag == (view_ch.tag - 14)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white,
                                   filterSevenBottom.first?.subviews.first?.backgroundColor == .white {
                                    filterNineBottom.first?.layer.borderWidth = 0
                                    view.layer.borderColor = UIColor.green.cgColor
                                    view.layer.borderWidth = 3
                                }
                            } else {
                                if (view.tag == (view_ch.tag - 28)) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterSevenBottom.first?.subviews.first?.backgroundColor == .white && filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .white {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                    }
                                } else {
                                    if (view.tag == (view_ch.tag - 42)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && filterSevenBottom.first?.subviews.first?.backgroundColor == .white && filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .white && filterThirtyfiveBottom.first?.subviews.first?.backgroundColor == .white {
                                            view.layer.borderColor = UIColor.green.cgColor
                                            view.layer.borderWidth = 3
                                        }
                                    } else {
//                                        check
                                        if (view.tag == (view_ch.tag + 4)) {
                                            if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterFourteenBottom.first?.backgroundColor != .white &&  filterSevenBottom.first?.subviews.first?.backgroundColor == .white && filterFiveBottom.first?.subviews.first?.backgroundColor == .white {
                                                view.layer.borderColor = UIColor.green.cgColor
                                                view.layer.borderWidth = 3
                                            }
                                        } else {
                                            if (view.tag == (view_ch.tag - 10)) {
                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                    filterSevenBottom.first?.subviews.first?.backgroundColor == .white &&
                                                    filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .white &&
                                                    filterNineteenBottom.first?.subviews.first?.backgroundColor == .white {
                                                    view.layer.borderColor = UIColor.green.cgColor
                                                    view.layer.borderWidth = 3
                                                }
                                            }
                                            else {
                                                if (view.tag == (view_ch.tag - 32)) {
                                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtytwoBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                        filterSevenBottom.first?.subviews.first?.backgroundColor == .white &&
                                                        filterTwentythreeBottom.first?.subviews.first?.backgroundColor == .white {
                                                        view.layer.borderColor = UIColor.green.cgColor
                                                        view.layer.borderWidth = 3
                                                    }
                                                } else {
                                                    if (view.tag == (view_ch.tag - 46)) {
                                                        if view.subviews.isEmpty, view.backgroundColor != .white,  filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                            filterFortysixBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                            filterSevenBottom.first?.subviews.first?.backgroundColor == .white &&
                                                            filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .white &&
                                                            filterThirtysevenBottom.first?.subviews.first?.backgroundColor == .white {
                                                            view.layer.borderColor = UIColor.green.cgColor
                                                            view.layer.borderWidth = 3
                                                        }
                                                    }
                                                    else {
                                                        //                         CHECK!!!
                                                        if checker.backgroundColor == .gray, view.tag == (view_ch.tag + 7) {
                                                            if view.backgroundColor != .white, view.subviews.isEmpty,
                                                               ((filterFourteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterSevenBottom.first?.subviews.first?.backgroundColor != .white) || filterSevenBottom.first(where: {$0.subviews.isEmpty}) != nil) &&
                                                                
                                                                ((filterEighteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterNineBottom.first?.subviews.first?.backgroundColor != .white) || filterNineBottom.first(where: {$0.subviews.isEmpty}) != nil) &&
                                                                
                                                                ((filterEighteenTop.first(where: {$0.subviews.isEmpty}) == nil || filterNineTop.first?.subviews.first?.backgroundColor != .white) || filterEighteenTop.first?.backgroundColor == .white || filterNineTop.first(where: {$0.subviews.isEmpty}) != nil)  {
                                                                view.layer.borderColor = UIColor.green.cgColor
                                                                view.layer.borderWidth = 3
                                                            }
                                                        } else {
                                                            if checker.backgroundColor == .gray, view.tag == (view_ch.tag + 9) {
                                                                if view.backgroundColor != .white, view.subviews.isEmpty,
                                                                   ((filterEighteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterNineBottom.first?.subviews.first?.backgroundColor != .white) || filterNineBottom.first(where: {$0.subviews.isEmpty}) != nil) &&
                                                                    
                                                                    (filterFourteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterSevenBottom.first?.subviews.first?.backgroundColor != .white || filterSevenBottom.first(where: {$0.subviews.isEmpty}) != nil) &&
                                                                    
                                                                    ((filterFourteenTop.first(where: {$0.subviews.isEmpty}) == nil || filterSevenTop.first?.subviews.first?.backgroundColor != .white || filterFourteenTop.first?.backgroundColor == .white) || filterSevenTop.first(where: {$0.subviews.isEmpty}) != nil)  {
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
        //MARK: backlight WHITE (right bottom)
        for view in board.subviews {
            if checker.backgroundColor == .white, (view.tag == (view_ch.tag + 18)) {
                if view.subviews.isEmpty, view.backgroundColor != .white,
                   filterNineTop.first?.subviews.first?.backgroundColor == .gray {
                    filterSevenTop.first?.layer.borderWidth = 0
                    view.layer.borderColor = UIColor.green.cgColor
                    view.layer.borderWidth = 3
                }
            } else {
                if (view.tag == (view_ch.tag + 4)) {
                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterFourTop.first(where: {$0.subviews.isEmpty}) != nil && filterSevenBottom.first?.subviews.first?.backgroundColor == .gray && filterFiveBottom.first?.subviews.first?.backgroundColor == .gray {
                        view.layer.borderColor = UIColor.green.cgColor
                        view.layer.borderWidth = 3
                    }
                } else {
                    if (view.tag == (view_ch.tag + 32)) {
                        if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtytwoTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .gray && filterTwentyfiveTop.first?.subviews.first?.backgroundColor == .gray {
                            view.layer.borderColor = UIColor.green.cgColor
                            view.layer.borderWidth = 3
                        }
                    }  else {
                        if (view.tag == (view_ch.tag + 36)) {
                            if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtysixTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .gray && filterTwentysevenTop.first?.subviews.first?.backgroundColor == .gray  {
                                view.layer.borderColor = UIColor.green.cgColor
                                view.layer.borderWidth = 3
                            }
                        }  else {
                            if (view.tag == (view_ch.tag + 54)) {
                                if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtysixTop.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyfourTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .gray && filterTwentysevenTop.first?.subviews.first?.backgroundColor == .gray && filterFortyFiveTop.first?.subviews.first?.backgroundColor == .gray  {
                                    view.layer.borderColor = UIColor.green.cgColor
                                    view.layer.borderWidth = 3
                                }
                            } else {
                                if (view.tag == (view_ch.tag + 22)) {
                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtysixTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentytwoTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .gray && filterTwentysevenTop.first?.subviews.first?.backgroundColor == .gray && filterTwentyNineTop.first?.subviews.first?.backgroundColor == .gray  {
                                        view.layer.borderColor = UIColor.green.cgColor
                                        view.layer.borderWidth = 3
                                    }
                                } else {
                                    if (view.tag == (view_ch.tag + 50)) {
                                        if view.subviews.isEmpty, view.backgroundColor != .white,  filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterThirtysixTop.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyTop.first(where: {$0.subviews.isEmpty}) != nil && filterNineTop.first?.subviews.first?.backgroundColor == .gray && filterTwentysevenTop.first?.subviews.first?.backgroundColor == .gray && filterFortythreeTop.first?.subviews.first?.backgroundColor == .gray {
                                            view.layer.borderColor = UIColor.green.cgColor
                                            view.layer.borderWidth = 3
                                        }
                                    }
                                    //MARK: backlight WHITE (left bottom)
                                    else  {
                                        if checker.backgroundColor == .white, (view.tag == (view_ch.tag + 14)) {
                                            if view.subviews.isEmpty, view.backgroundColor != .white,
                                               filterSevenTop.first?.subviews.first?.backgroundColor == .gray {
                                                filterNineTop.first?.layer.borderWidth = 0
                                                view.layer.borderColor = UIColor.green.cgColor
                                                view.layer.borderWidth = 3
                                            }
                                        } else {
                                            if (view.tag == (view_ch.tag + 28)) {
                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterSevenTop.first?.subviews.first?.backgroundColor == .gray && filterTwentyOneTop.first?.subviews.first?.backgroundColor == .gray {
                                                    view.layer.borderColor = UIColor.green.cgColor
                                                    view.layer.borderWidth = 3
                                                }
                                            } else {
                                                if (view.tag == (view_ch.tag + 42)) {
                                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && filterSevenTop.first?.subviews.first?.backgroundColor == .gray && filterTwentyOneTop.first?.subviews.first?.backgroundColor == .gray && filterThirtyFiveTop.first?.subviews.first?.backgroundColor == .gray  {
                                                        view.layer.borderColor = UIColor.green.cgColor
                                                        view.layer.borderWidth = 3
                                                    }
                                                } else {
                                                    if (view.tag == (view_ch.tag - 4)) {
                                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&  filterSevenTop.first?.subviews.first?.backgroundColor == .gray &&  filterFiveTop.first?.subviews.first?.backgroundColor == .gray  {
                                                            view.layer.borderColor = UIColor.green.cgColor
                                                            view.layer.borderWidth = 3
                                                        }
                                                    } else {
                                                        if (view.tag == (view_ch.tag + 10)) {
                                                            if view.subviews.isEmpty, view.backgroundColor != .white,  filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                filterSevenTop.first?.subviews.first?.backgroundColor == .gray &&
                                                                filterTwentyOneTop.first?.subviews.first?.backgroundColor == .gray &&
                                                                filterNineteenTop.first?.subviews.first?.backgroundColor == .gray {
                                                                view.layer.borderColor = UIColor.green.cgColor
                                                                view.layer.borderWidth = 3
                                                            }
                                                        }
                                                        else {
                                                            if (view.tag == (view_ch.tag + 32)) {
                                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterThirtytwoTop.first(where: {$0.subviews.isEmpty}) != nil && filterSevenTop.first?.subviews.first?.backgroundColor == .gray &&
                                                                    filterTwentythreeTop.first?.subviews.first?.backgroundColor == .gray {
                                                                    view.layer.borderColor = UIColor.green.cgColor
                                                                    view.layer.borderWidth = 3
                                                                }
                                                            } else {
                                                                if (view.tag == (view_ch.tag + 46)) {
                                                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                        filterFortysixTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                        filterSevenTop.first?.subviews.first?.backgroundColor == .gray &&
                                                                        filterTwentyOneTop.first?.subviews.first?.backgroundColor == .gray &&
                                                                        filterThirtysevenTop.first?.subviews.first?.backgroundColor == .gray {
                                                                        view.layer.borderColor = UIColor.green.cgColor
                                                                        view.layer.borderWidth = 3
                                                                    }
                                                                    //MARK: backlight WHITE (right top)
                                                                } else {
                                                                    if checker.backgroundColor == .white, (view.tag == (view_ch.tag - 18)) {
                                                                        if view.subviews.isEmpty, view.backgroundColor != .white,
                                                                           filterNineBottom.first?.subviews.first?.backgroundColor == .gray {
                                                                            filterSevenBottom.first?.layer.borderWidth = 0
                                                                            view.layer.borderColor = UIColor.green.cgColor
                                                                            view.layer.borderWidth = 3
                                                                        }
                                                                    } else {
                                                                        if (view.tag == (view_ch.tag - 4)) {
                                                                            if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&  filterFourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .gray && filterElevenBottom.first?.subviews.first?.backgroundColor == .gray  {
                                                                                view.layer.borderColor = UIColor.green.cgColor
                                                                                view.layer.borderWidth = 3
                                                                            }
                                                                        } else {
                                                                            if (view.tag == (view_ch.tag - 32)) {
                                                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtytwoBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentyfiveBottom.first?.subviews.first?.backgroundColor == .gray  {
                                                                                    view.layer.borderColor = UIColor.green.cgColor
                                                                                    view.layer.borderWidth = 3
                                                                                }
                                                                            }  else {
                                                                                if (view.tag == (view_ch.tag - 36)) {
                                                                                    if view.subviews.isEmpty, view.backgroundColor != .white,  filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtysixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentysevenBottom.first?.subviews.first?.backgroundColor == .gray  {
                                                                                        view.layer.borderColor = UIColor.green.cgColor
                                                                                        view.layer.borderWidth = 3
                                                                                    }
                                                                                }  else {
                                                                                    if (view.tag == (view_ch.tag - 54)) {
                                                                                        if view.subviews.isEmpty, view.backgroundColor != .white,  filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtysixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyfourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentysevenBottom.first?.subviews.first?.backgroundColor == .gray && filterFortyFiveBottom.first?.subviews.first?.backgroundColor == .gray  {
                                                                                            view.layer.borderColor = UIColor.green.cgColor
                                                                                            view.layer.borderWidth = 3
                                                                                        }
                                                                                    } else {
                                                                                        if (view.tag == (view_ch.tag - 22)) {
                                                                                            if view.subviews.isEmpty, view.backgroundColor != .white, filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtysixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentytwoBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentysevenBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentyNineBottom.first?.subviews.first?.backgroundColor == .gray {
                                                                                                view.layer.borderColor = UIColor.green.cgColor
                                                                                                view.layer.borderWidth = 3
                                                                                            }
                                                                                        } else {
                                                                                            if (view.tag == (view_ch.tag - 50)) {
                                                                                                if view.subviews.isEmpty, view.backgroundColor != .white,  filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtysixBottom.first(where: {$0.subviews.isEmpty}) != nil && filterFiftyfourBottom.first(where: {$0.subviews.isEmpty}) != nil && filterNineBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentysevenBottom.first?.subviews.first?.backgroundColor == .gray && filterFortythreeBottom.first?.subviews.first?.backgroundColor == .gray  {
                                                                                                    view.layer.borderColor = UIColor.green.cgColor
                                                                                                    view.layer.borderWidth = 3
                                                                                                }
                                                                                                //MARK: backlight WHITE (left top) +
                                                                                            } else {
                                                                                                if checker.backgroundColor == .white, (view.tag == (view_ch.tag - 14)) {
                                                                                                    if view.subviews.isEmpty, view.backgroundColor != .white,
                                                                                                       filterSevenBottom.first?.subviews.first?.backgroundColor == .gray {
                                                                                                        filterNineBottom.first?.layer.borderWidth = 0
                                                                                                        view.layer.borderColor = UIColor.green.cgColor
                                                                                                        view.layer.borderWidth = 3
                                                                                                    }
                                                                                                } else {
                                                                                                    if (view.tag == (view_ch.tag - 28)) {
                                                                                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterSevenBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .gray {
                                                                                                            view.layer.borderColor = UIColor.green.cgColor
                                                                                                            view.layer.borderWidth = 3
                                                                                                        }
                                                                                                    } else {
                                                                                                        if (view.tag == (view_ch.tag - 42)) {
                                                                                                            if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && filterSevenBottom.first?.subviews.first?.backgroundColor == .gray && filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .gray && filterThirtyfiveBottom.first?.subviews.first?.backgroundColor == .gray  {
                                                                                                                view.layer.borderColor = UIColor.green.cgColor
                                                                                                                view.layer.borderWidth = 3
                                                                                                            }
                                                                                                        } else {
                                                                                                            if (view.tag == (view_ch.tag + 4)) {
                                                                                                                if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&  filterSevenBottom.first?.subviews.first?.backgroundColor == .gray &&  filterFiveBottom.first?.subviews.first?.backgroundColor == .gray  {
                                                                                                                    view.layer.borderColor = UIColor.green.cgColor
                                                                                                                    view.layer.borderWidth = 3
                                                                                                                }
                                                                                                            } else {
                                                                                                                if (view.tag == (view_ch.tag - 10)) {
                                                                                                                    if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                        filterSevenBottom.first?.subviews.first?.backgroundColor == .gray &&
                                                                                                                        filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .gray &&
                                                                                                                        filterNineteenBottom.first?.subviews.first?.backgroundColor == .gray {
                                                                                                                        view.layer.borderColor = UIColor.green.cgColor
                                                                                                                        view.layer.borderWidth = 3
                                                                                                                    }
                                                                                                                }
                                                                                                                else {
                                                                                                                    if (view.tag == (view_ch.tag - 32)) {
                                                                                                                        if view.subviews.isEmpty, view.backgroundColor != .white, filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterThirtytwoBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                            filterSevenBottom.first?.subviews.first?.backgroundColor == .gray &&
                                                                                                                            filterTwentythreeBottom.first?.subviews.first?.backgroundColor == .gray {
                                                                                                                            view.layer.borderColor = UIColor.green.cgColor
                                                                                                                            view.layer.borderWidth = 3
                                                                                                                        }
                                                                                                                    } else {
                                                                                                                        if (view.tag == (view_ch.tag - 46)) {
                                                                                                                            if view.subviews.isEmpty, view.backgroundColor != .white,  filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && filterTwentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                                filterFortysixBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                                filterSevenBottom.first?.subviews.first?.backgroundColor == .gray &&
                                                                                                                                filterTwentyOneBottom.first?.subviews.first?.backgroundColor == .gray &&
                                                                                                                                filterThirtysevenBottom.first?.subviews.first?.backgroundColor == .gray {
                                                                                                                                view.layer.borderColor = UIColor.green.cgColor
                                                                                                                                view.layer.borderWidth = 3
                                                                                                                            }
                                                                                } else {
                                                                                    if checker.backgroundColor == .white, view.tag == (view_ch.tag - 7) {
                                                                                    if view.backgroundColor != .white, view.subviews.isEmpty,
                                                                                    ((filterFourteenTop.first(where: {$0.subviews.isEmpty}) == nil || filterSevenTop.first?.subviews.first?.backgroundColor != .gray) || filterSevenTop.first(where: {$0.subviews.isEmpty}) != nil) &&
                                                                                    ((filterEighteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterNineBottom.first?.subviews.first?.backgroundColor != .gray) || filterNineBottom.first(where: {$0.subviews.isEmpty}) != nil || filterEighteenBottom.first?.backgroundColor == .white) &&
                                                                                    ((filterEighteenTop.first(where: {$0.subviews.isEmpty}) == nil || filterNineTop.first?.subviews.first?.backgroundColor != .gray) || filterNineTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                    view.layer.borderColor = UIColor.green.cgColor
                                                                                    view.layer.borderWidth = 3
                                                                                    }
                                                                                } else {
                                                                                    if checker.backgroundColor == .white, view.tag == (view_ch.tag - 9) {
                                                                                    if view.backgroundColor != .white, view.subviews.isEmpty, ((filterEighteenTop.first(where: {$0.subviews.isEmpty}) == nil || filterNineTop.first?.subviews.first?.backgroundColor != .gray) || filterNineTop.first(where: {$0.subviews.isEmpty}) != nil) &&
                                                                                    ((filterFourteenBottom.first(where: {$0.subviews.isEmpty}) == nil || filterSevenBottom.first?.subviews.first?.backgroundColor != .gray) || filterSevenBottom.first(where: {$0.subviews.isEmpty}) != nil) &&
                                                                                    ((filterFourteenTop.first(where: {$0.subviews.isEmpty}) == nil || filterSevenTop.first?.subviews.first?.backgroundColor != .gray) || filterSevenTop.first(where: {$0.subviews.isEmpty}) != nil) {
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
