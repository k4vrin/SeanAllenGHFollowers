//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Mostafa Hosseini on 4/8/24.
//

import SwiftUI
import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallForActionButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hiding Navbar
        // If we do it in viewDidLoad, it does turned on when view reapear (once)
        // But here it happens every time view apears (everytime)
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(resource: .ghLogo)
        
        // Usually is gonna be 3 to 4 constraints.
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // The smallest iPhone width is 320 pt (iPhone SE)
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            // Minimum suggested touch target is 44pt
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func configureCallForActionButton() {
        view.addSubview(callToActionButton)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - Preview

struct SearchVCWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SearchVC {
        return SearchVC()
    }

    func updateUIViewController(_ uiViewController: SearchVC, context: Context) {}

    typealias UIViewControllerType = SearchVC
}

#Preview {
    SearchVCWrapper()
        .previewLayout(.sizeThatFits)
}
