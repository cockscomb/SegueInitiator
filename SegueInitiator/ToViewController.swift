//  The MIT License (MIT)
//
//  Copyright (c) 2016 Hiroki Kato
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

class ToViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    var entry: Entry!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = entry.title
    }
}

class ToSegue: TypedSegueInitiator {
    let entry: Entry

    init(entry: Entry) {
        self.entry = entry
    }

    static let identifier = "ToSegue"
    typealias Source = UIViewController
    typealias Destination = ToViewController
    func prepareWithSource(source: Source, destination: Destination) {
        destination.entry = entry
    }
}

class AnotherSegue: TypedSegueInitiator {
    let entry: Entry

    init(entry: Entry) {
        self.entry = entry
    }

    static let identifier = "AnotherSegue"
    typealias Source = UIViewController
    typealias Destination = ToViewController
    func prepareWithSource(source: Source, destination: Destination) {
        destination.entry = entry
    }
}
