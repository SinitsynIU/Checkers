//
//  AdsManager.swift
//  Weather
//
//  Created by Илья Синицын on 12.05.2022.
//

import GoogleMobileAds
import UIKit

class AdsManager {
    static let shared = AdsManager()
    
    var interstitial: GADInterstitialAd?
    var rewardedAd: GADRewardedAd?
    
    func setupBunner(bannerView: GADBannerView, viewController: UIViewController) {
        // my banner ID = ca-app-pub-2048459780354579/3538038107
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = viewController
        bannerView.load(GADRequest())
    }
    
    func setupInterstitial(viewController: UIViewController, onError: @escaping(() -> ())) {
            let request = GADRequest()
                // my interstitial ID = ca-app-pub-2048459780354579/5391580798
                GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                                        request: request,
                              completionHandler: { [self] ad, error in
                                if let error = error {
                                  print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                                    onError()
                                  return
                                }
                                interstitial = ad
                                interstitial?.present(fromRootViewController: viewController)
                              })
    }
    
    func setupRewarded(viewController: UIViewController, onCompleted: @escaping(() -> ()), onError: @escaping(() -> ())) {
        let request = GADRequest()
        // my reward ID = ca-app-pub-2048459780354579/2224956435
        GADRewardedAd.load(withAdUnitID:"ca-app-pub-3940256099942544/1712485313",
                            request: request,
                            completionHandler: { [self] ad, error in
             if let error = error {
               print("Failed to load rewarded ad with error: \(error.localizedDescription)")
                 onError()
               return
             }
             ad?.present(fromRootViewController: viewController) {
                 print("Reward")
                 onCompleted()
            }
            rewardedAd = ad
            print("Rewarded ad loaded.")
            rewardedAd?.fullScreenContentDelegate = viewController as? GADFullScreenContentDelegate
           })
    }
}
