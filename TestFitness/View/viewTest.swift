//
//  view test.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 15.10.2022.
//

import UIKit

class viewTest: UIView {
    
    // MARK: - Interface
    
    var onDecrease: (() -> Void)?
    var onIncrease: (() -> Void)?
//    private let name: String
    
    // MARK: - Subviews
    
    @IBOutlet weak var labelName: UILabel!    
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var buttonMinus: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        viewInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        viewInit()
    }
    
    func viewInit(){
        let xibView = Bundle.main.loadNibNamed("viewTest", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)

    }
    
}
