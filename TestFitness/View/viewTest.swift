//
//  view test.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 15.10.2022.
//

import UIKit

class viewTest: UIView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        viewInit()
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        viewInit()
        
    }
    
    func viewInit(){
        let xibView = Bundle.main.loadNibNamed("viewTest", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)

    }
    
}
