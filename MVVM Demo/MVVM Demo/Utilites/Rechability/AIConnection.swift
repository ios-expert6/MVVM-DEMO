//
//  AIConnection.swift
//  Kings Court
//
//  Created by gwl on 12/11/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import UIKit
import  SystemConfiguration

class AIConnection: UIViewController {
    // Internet available status for check
    enum Status {
        case connected, disconnected
    }
    weak var appDelegate: AppDelegate?
    var imageLogo: UIImageView = {
        let imageViewLogo = UIImageView()
        imageViewLogo.image = #imageLiteral(resourceName: "splashLogo")
        imageViewLogo.layer.cornerRadius = imageViewLogo.frame.height/2
        imageViewLogo.clipsToBounds = true
        imageViewLogo.contentMode = .scaleAspectFit
        imageViewLogo.translatesAutoresizingMaskIntoConstraints = false
        return imageViewLogo
    }()
    var imageLogo1: UIImageView = {
        let imageViewLogo2 = UIImageView()
        imageViewLogo2.image = #imageLiteral(resourceName: "404")
        imageViewLogo2.layer.cornerRadius = imageViewLogo2.frame.height/2
        imageViewLogo2.clipsToBounds = true
        imageViewLogo2.contentMode = .scaleAspectFit
        imageViewLogo2.translatesAutoresizingMaskIntoConstraints = false
        return imageViewLogo2
    }()
    var labelMessage: UILabel = {
        let label = UILabel()
        label.text = "No internet connections. Please check your internet settings."
        label.numberOfLines = 4
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.disableColor.cgColor
        label.font = .textViewFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var buttonTryAgain: UIButton = {
        let buttonTryAgain = UIButton()
        buttonTryAgain.setTitle("Retry", for: [])
        buttonTryAgain.setTitleColor(.enableColor, for: .normal)
        buttonTryAgain.titleLabel?.textAlignment = .center
        buttonTryAgain.backgroundColor = .clear
        buttonTryAgain.titleLabel?.textColor = .enableColor
        buttonTryAgain.titleLabel?.font = .textViewFont
        buttonTryAgain.translatesAutoresizingMaskIntoConstraints = false
        buttonTryAgain.clipsToBounds = true
        // buttonTryAgain.layer.cornerRadius = 8
        buttonTryAgain.addTarget(self, action: #selector(actionTryAgain), for: .touchUpInside)
        return buttonTryAgain
    }()
    lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.backgroundColor = UIColor.black
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    static let sharedInstance: AIConnection = {
        let instance = AIConnection()
        return instance
    }()
    var timer: Timer?
    var alertWindow: UIWindow?
    // life cycle begins from here
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
    }
    // initial setups for view
    func viewSetup() {
        view.backgroundColor = .black
        view.isOpaque = false
        view.addSubview(blurView)
        view.addSubview(labelMessage)
        labelMessage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        labelMessage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        labelMessage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        labelMessage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.addSubview(buttonTryAgain)
        buttonTryAgain.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonTryAgain.topAnchor.constraint(equalTo: labelMessage.bottomAnchor, constant: 20).isActive = true
        buttonTryAgain.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonTryAgain.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.addSubview(imageLogo)
        imageLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageLogo.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        imageLogo.heightAnchor.constraint(equalToConstant: 64).isActive = true
        imageLogo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        view.addSubview(imageLogo1)
        imageLogo1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageLogo1.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 280).isActive = true
        imageLogo1.heightAnchor.constraint(equalToConstant: 140).isActive = true
        imageLogo1.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
    func startEngine() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.validateTimer(internetStatus: .connected)
        }
    }
    @objc func actionTryAgain() {
        buttonTryAgain.setTitle("Checking...", for: [])
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.buttonTryAgain.setTitle("Try Again", for: [])
        }
    }
    func validateTimer(internetStatus: Status) {
        // check if previous timer was successfully invalidated
        if timer != nil {
            timer?.invalidate()
        }
        if internetStatus == .connected {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
                                         selector: #selector(internetConnected),
                                         userInfo: nil, repeats: true)
        } else if internetStatus == .disconnected {
            timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(internetDisconnected),
                                         userInfo: nil, repeats: true)
        }
    }

    // This will continuously checks if internet connection breaks and presents our no internet connection view
    @objc func internetConnected() {
        if !isInternetAvailable() {
            if self.alertWindow == nil {
                alertWindow = UIWindow(frame: UIScreen.main.bounds)
                alertWindow?.rootViewController = UIViewController()
                alertWindow?.windowLevel = UIWindow.Level.alert + 1
            }
            alertWindow?.makeKeyAndVisible()
            self.modalPresentationStyle = .overFullScreen
            if self.presentingViewController != nil {
                return
            }
            if alertWindow?.rootViewController?.presentingViewController != nil {
                return
            }
            alertWindow?.rootViewController?.present(self, animated: false, completion: {
                self.timer?.invalidate()
                self.validateTimer(internetStatus: .disconnected)
            })
        }
    }
    // This will continuosly checks if our internet connection is
    // Stablished again and dismiss the no internet connection view
    @objc func internetDisconnected() {
        if isInternetAvailable() {
            alertWindow?.windowLevel = UIWindow.Level.alert - 1
            alertWindow?.makeKeyAndVisible()
            alertWindow = nil
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.dismiss(animated: false) {
                    self.timer?.invalidate()
                    self.validateTimer(internetStatus: .connected)
                }
            }
        } else {
            self.internetConnected()
        }
    }
}
extension NSObject {
    func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
}
