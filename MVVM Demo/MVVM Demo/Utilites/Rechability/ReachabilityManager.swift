//
//  ReachabilityManager.swift
//  Kings Court
//
//  Created by gwl on 12/11/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import ReachabilitySwift

/// Protocol for listenig network status change
public protocol NetworkStatusListener: class {
    func networkStatusDidChange(status: Reachability.NetworkStatus)
}

class ReachabilityManager: NSObject {
    static  let shared = ReachabilityManager()
    var isNetworkAvailable: Bool {
        return reachabilityStatus != .notReachable
    }
    var reachabilityStatus: Reachability.NetworkStatus = .notReachable
    let reachability = Reachability()
    var listeners = [NetworkStatusListener]()
    @objc func reachabilityChanged(notification: Notification) {
        if let reachability = notification.object as? Reachability {
            reachabilityStatus = reachability.currentReachabilityStatus
            switch reachability.currentReachabilityStatus {
            case .notReachable:
                break
            case .reachableViaWiFi, .reachableViaWWAN:
                break
            }
        }
        // Sending message to each of the delegates
        for listener in listeners {
            if let reachability = reachability {
                listener.networkStatusDidChange(status: reachability.currentReachabilityStatus)
            }
        }
    }
    func startMonitoring() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.reachabilityChanged),
                                               name: ReachabilityChangedNotification,
                                               object: reachability)
        do {
            try reachability?.startNotifier()
        } catch {
            debugPrint("Could not start reachability notifier")
        }
    }
    func stopMonitoring() {
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self,
                                                  name: ReachabilityChangedNotification,
                                                  object: reachability)
    }
    /// Adds a new listener to the listeners array
    ///
    /// - parameter delegate: a new listener
    func addListener(listener: NetworkStatusListener) {
        listeners.append(listener)
    }
    /// Removes a listener from listeners array
    ///
    /// - parameter delegate: the listener which is to be removed
    func removeListener(listener: NetworkStatusListener) {
        listeners = listeners.filter { $0 !== listener }
    }
}

class UILabelPro: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    func setup() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.reachabilityChanged),
                                               name: ReachabilityChangedNotification,
                                               object: nil)
        updateLabel()
    }
    @objc func reachabilityChanged(notification: Notification) {
        updateLabel()
    }
    func updateLabel() {
        let reachability = ReachabilityManager.shared.reachability
        switch reachability?.currentReachabilityStatus {
        case .notReachable:
            DispatchQueue.main.async {
                if self.tag == 1 { // Notification List offline message
                    self.text = "You are offline, Please check your internet connection to get new Notifications."
                } else {
                    self.text = "You are offline, Please check your internet connection."
                }
            }
        case .reachableViaWiFi, .reachableViaWWAN:
            DispatchQueue.main.async { self.text = "" }
        case .none:
            break
        }
    }
}
