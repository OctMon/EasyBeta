//
//  EasyBeta.swift
//  Easy
//
//  Created by OctMon on 2018/10/13.
//

import UIKit

import Easy
import FLEX
import GDPerformanceView_Swift
import OOMDetector

public struct EasyBeta {
    
}

public extension EasyBeta {
    
    static func configTestTool() {
        EasyApp.isBeta = true
        
        FLEXManager.shared.isNetworkDebuggingEnabled = true
        PerformanceMonitor.shared().performanceViewConfigurator.options = .all
        PerformanceMonitor.shared().performanceViewConfigurator.style = .light
        EasyLog.clear()
        EasyApp.window?.longPress(minimumPressDuration: 1, numberOfTouchesRequired: 3, handler: { (r) in
            if r.state == .began {
                isShowTestTool.toggle()
            }
        }).delegate = BetaGesture.shared
    }
    
}

public extension EasyApp {
    
    static func configCheckPgyer(api_key: String , shortcutUrl: String, buildPassword: String, headerImage: UIImage? = nil, delay: TimeInterval = 3, isWillEnterForegroundCheck: Bool = true) {
        EasyCheck.configPgyerBeta(api_key: api_key, shortcutUrl: shortcutUrl, buildPassword: buildPassword, headerImage: headerImage, delay: delay, isWillEnterForegroundCheck: isWillEnterForegroundCheck)
    }
    
    static func configTestTool() {
        EasyBeta.configTestTool()
    }
    
}

public extension EasySession {
    
    func addToShowBaseURL() {
        guard self.config.url.global == nil else {
            EasyLog.debug("info: addToShowBaseURL && (global == nil)")
            return
        }
        sessions.append(self)
    }
    
}

var sessions = [EasySession]()
var isShowPerformanceMonitor = false {
    willSet {
        if newValue {
            PerformanceMonitor.shared().start()
            PerformanceMonitor.shared().show()
        } else {
            PerformanceMonitor.shared().pause()
            PerformanceMonitor.shared().hide()
        }
    }
}
var isShowMemoryDetectorMonitor = false {
    willSet {
        if newValue {
            OOMDetector.getInstance()?.setupWithDefaultConfig()
            OOMDetector.getInstance()?.setupLeakChecker()
        } else {
            OOMDetector.getInstance()?.stopMallocStackMonitor()
        }
        OOMDetector.getInstance()?.showMemoryIndicatorView(newValue)
    }
}
public var isShowTestTool = false {
    willSet {
        if newValue {
            (EasyApp.currentViewController ?? EasyApp.currentTabBarController)?.showDetailViewController(UINavigationController(rootViewController: EasyTestViewController()), sender: nil)
        } else {
            EasyApp.currentViewController?.dismiss(animated: true, completion: nil)
        }
    }
}

private class BetaGesture: NSObject, UIGestureRecognizerDelegate {
    
    static var shared = BetaGesture()
    
    private override init () { }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
