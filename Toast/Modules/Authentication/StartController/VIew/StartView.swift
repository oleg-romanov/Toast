//
//  StartView.swift
//  Toast
//
//  Created by Олег Романов on 3/12/21.
//

import SnapKit
import UIKit

class StartView: UIView {
    struct Appearance {
        static let titleText: String = "TOAST"
        static let titleFontSize: CGFloat = 25
        static let titleFontWeight: UIFont.Weight = .bold
        static let subTitleText: String = "Списки событий"
        static let subTitleFontSize: CGFloat = 18
        static let subTitleFontWeight: UIFont.Weight = .regular
        static let heightOfButton: CGFloat = 40
        static let buttonWidth: CGFloat = UIScreen.main.bounds.width - 80
        static let lineViewWidth: CGFloat = UIScreen.main.bounds.width - 64
        static let bottomPaddingLastButton: CGFloat = 83
    }

    // MARK: - Properties

    private lazy var logoImageView = UIImageView(image: Assets.logo.image)

    lazy var signInWithEmail = ButtonSignInWithEmail(title: Text.SignIn.continueWithEmail)

    lazy var signInWithGoogle = ButtonSignIn(title: Text.SignIn.continueWithGoogle, buttonColor: Assets.googleRed.color, logo: Assets.googleLogo.image)

    lazy var signInWithFacebook = ButtonSignIn(title: Text.SignIn.continueWithFacebook, buttonColor: Assets.facebookBlue.color, logo: Assets.facebookLogo.image)

    lazy var signInWithApple = ButtonSignIn(title: Text.SignIn.continueWithApple, buttonColor: .black, logo: Assets.appleLogo.image)

    lazy var signInAsGuest: UIButton = {
        let button = UIButton()
        button.setTitle(Text.SignIn.continueAsGuest, for: .normal)
        button.setTitleColor(Assets.blue.color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return button
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Appearance.titleText
        label.font = .systemFont(ofSize: Appearance.titleFontSize, weight: Appearance.titleFontWeight)
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Appearance.subTitleText
        label.font = .systemFont(ofSize: Appearance.subTitleFontSize, weight: Appearance.subTitleFontWeight)
        label.textColor = Assets.gray.color
        return label
    }()

    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = Assets.lightgray.color
        return view
    }()

    // как распологать элементы и их размер
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = UIScreen.main.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        return layout
    }()

    init() {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = Assets.background1.color
    }

    private func addSubviews() {
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(signInWithEmail)
        addSubview(signInWithGoogle)
        addSubview(signInWithFacebook)
        addSubview(signInWithApple)
        addSubview(signInAsGuest)
        addSubview(lineView)
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            if ScreenSize.current != .sizeIPhoneSE {
                make.top.equalToSuperview().inset(81)
            } else {
                make.top.equalToSuperview().inset(40)
            }
            make.centerX.equalToSuperview()
        }
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(18)
            make.centerX.equalToSuperview()
            make.size.equalTo(100)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(18)
            make.centerX.equalToSuperview()
        }
        signInWithEmail.snp.makeConstraints { make in
            if ScreenSize.current != .sizeIPhoneSE {
                make.bottom.equalTo(signInAsGuest.snp.top).inset(-72)
            } else {
                make.bottom.equalTo(signInAsGuest.snp.top).inset(-30)
            }
            // на se коэфф: 0,5; на 7: 0,7 на 10: 1
            make.centerX.equalToSuperview()
            make.height.equalTo(Appearance.heightOfButton)
            make.width.equalTo(Appearance.buttonWidth)
        }
        signInWithGoogle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(Appearance.heightOfButton)
            make.width.equalTo(Appearance.buttonWidth)
            make.bottom.equalTo(signInWithEmail.snp.top).inset(-72)
        }
        signInWithFacebook.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(Appearance.heightOfButton)
            make.width.equalTo(Appearance.buttonWidth)
            make.bottom.equalTo(signInWithGoogle.snp.top).inset(-22)
        }
        signInWithApple.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(Appearance.heightOfButton)
            make.width.equalTo(Appearance.buttonWidth)
            make.bottom.equalTo(signInWithFacebook.snp.top).inset(-22)
        }
        signInAsGuest.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            if ScreenSize.current != .sizeIPhoneSE {
                make.bottom.equalToSuperview().inset(Appearance.bottomPaddingLastButton)
            } else {
                make.bottom.equalToSuperview().inset(Appearance.bottomPaddingLastButton - 60)
            }
        }
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(Appearance.lineViewWidth)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(signInWithEmail.snp.top).inset(-34)
        }
    }
}
