//
//  OnboardingModel.swift
//  Toast
//
//  Created by Олег Романов on 03.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

struct Slide {
    var title: String
    var subtitle: String

    static func generateSlides() -> [Slide] {
        let slide1 = Slide(
            title: "Добро пожаловать!",
            subtitle: "текст текст текст текст"
        )
        let slide2 = Slide(
            title: "Крутой функсия",
            subtitle: "текст текст текст текст текст текст текст текст текст текст тексттекст текст текст текст текст текст текст текст"
        )
        let slide3 = Slide(
            title: "wg",
            subtitle: "sds"
        )
        let slide4 = Slide(
            title: "k.f",
            subtitle: "dmvk"
        )

        return [slide1, slide2, slide3, slide4]
    }
}
