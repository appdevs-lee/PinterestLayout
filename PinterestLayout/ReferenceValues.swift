//
//  ReferenceValues.swift
//  Universal
//
//  Created by Yongseok Choi on 2023/04/04.
//

import UIKit
import CoreLocation

enum MyError: Error {
    case dateError
}

struct ReferenceValues {
    static weak var keyWindow: UIWindow!
    
    static var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    static var isLaunchedBefore: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isLaunchedBefore")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isLaunchedBefore")
        }
    }
    
    static var isCheckPermission: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isCheckPermission")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isCheckPermission")
        }
    }
    
    static var isLoginCheck: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isLoginCheck")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isLoginCheck")
        }
    }
    
    static var deviceCode: String {
        get {
            return UserDefaults.standard.string(forKey: "deviceCode") ?? ""
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "deviceCode")
        }
    }
    
    static var fcmToken: String {
        get {
            return UserDefaults.standard.string(forKey: "fcmToken") ?? ""
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "fcmToken")
        }
    }
    
    static var isCheckBackgroundLocation: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isCheckBackgroundLocation")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isCheckBackgroundLocation")
        }
    }
    
//    static var appMark: String {
//        var appMark: String!
//        
//        switch ServerSetting.server {
//        case .DEV:
//            appMark = "DEV"
//            
//        case .QA:
//            appMark = "QA"
//            
//        case .RELEASE:
//            appMark = ""
//        }
//        
//        guard let dictionary = Bundle.main.infoDictionary,
//              let version = dictionary["CFBundleShortVersionString"] as? String,
//              let build = dictionary["CFBundleVersion"] as? String else {return appMark + " v(?)"}
//        
//        return appMark + " v\(version)(\(build))"
//    }
    
    static let kakaoAuthKey = ""
    
    static let expiredConditionMessage: String = "다른 기기에서 로그인 되었습니다."
    
    static weak var firstVC: ViewController?
    
    static var isAppUpdateCheckedOnce = false
    
}

// MARK: - Extension of referenceValues
extension ReferenceValues {
    struct Size {
        struct Device {
            static let width: CGFloat = ReferenceValues.keyWindow.screen.bounds.width
            static let height: CGFloat = ReferenceValues.keyWindow.screen.bounds.height
        }
        
        struct SafeAreaInsets {
            static let top: CGFloat = ReferenceValues.keyWindow.safeAreaInsets.top
            static let bottom: CGFloat = ReferenceValues.keyWindow.safeAreaInsets.bottom
            static let left: CGFloat = ReferenceValues.keyWindow.safeAreaInsets.left
            static let right: CGFloat = ReferenceValues.keyWindow.safeAreaInsets.right
        }
        
        struct Ratio {
            static let bannerHeightRatio: CGFloat = 100/343
        }
    }
    
    struct Velocity {
        static let hideBottomView: CGFloat = 650
    }
    
    struct LoadCount {
        struct Chat {
            static let room: Int = 3000
            static let mate: Int = 30
            static let message: Int = 30
        }
    }
    
    struct TextCount {
        struct Comment {
            static let comment: Int = 150
            static let subComment: Int = 150
        }
        
        struct Message {
            static let message: Int = 403
        }
        
        struct Travel {
            static let newPlaceName: Int = 20
            static let newPathName: Int = 30
            static let newPlaceDescription: Int = 300
            static let suggestWrite: Int = 650
            static let waitCount: Int = 3
            static let waitDescription: Int = 40
        }
    }
    
}
