//
//  ColorPalette.swift
//  CrossFitTimer
//
//  Created by Павел Анплеенко on 02/01/17.
//  Copyright © 2017 Pavel Anpleenko. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
	open class var yellowBGColor: UIColor{
		return UIColor(colorLiteralRed: 246/255, green: 237/255, blue: 171/255, alpha: 1) //желтый фоновый
	}
	open class var yellowTextColor: UIColor {
		return UIColor(colorLiteralRed: 243/255, green: 210/255, blue: 95/255, alpha: 1) //желтый для текста
	}
	open class var greenBGColor: UIColor {
		return UIColor(colorLiteralRed: 194/255, green: 241/255, blue: 147/255, alpha: 1) //зеленый фоновый
	}
	open class var greenTextColor: UIColor{
		return UIColor(colorLiteralRed: 135/255, green: 210/255, blue: 108/255, alpha: 1) //зеленый для текста
	}
	open class var redBGColor: UIColor{
		return UIColor(colorLiteralRed: 243/255, green: 150/255, blue: 150/255, alpha: 1) //красный для фона
	}
	open class var redTextColor: UIColor{
		return UIColor(colorLiteralRed: 222/255, green: 82/255, blue: 82/255, alpha: 1) //красный для текста
	}
}
