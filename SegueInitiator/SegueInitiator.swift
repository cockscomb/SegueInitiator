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

protocol SegueInitiator: class {
    static var identifier: String { get }
    func prepare(segue: UIStoryboardSegue)
}

extension SegueInitiator {
    static func match(segue: UIStoryboardSegue) -> Bool {
        return identifier == segue.identifier
    }
    func performFrom(viewController: UIViewController) {
        viewController.performSegueWithIdentifier(Self.identifier, sender: self)
    }
}

protocol TypedSegueInitiator: SegueInitiator {
    typealias Source: UIViewController
    typealias Destination: UIViewController
    func prepareWithSource(source: Source, destination: Destination)
}

extension TypedSegueInitiator {
    static func match(segue: UIStoryboardSegue) -> Bool {
        return identifier == segue.identifier &&
            segue.sourceViewController is Source &&
            segue.destinationViewController is Destination
    }
    func prepare(segue: UIStoryboardSegue) {
        if let source = segue.sourceViewController as? Source,
            let destination = segue.destinationViewController as? Destination {
                prepareWithSource(source, destination: destination)
        } else {
            fatalError("Given segue '\(segue.dynamicType) - Identifier: \(segue.identifier ?? ""), Source: \(segue.sourceViewController.dynamicType), Destination: \(segue.destinationViewController.dynamicType)' does not match this SegueInitiator '\(self.dynamicType) - Identifier: \(self.dynamicType.identifier), Source: \(Source.self), Destination: \(Destination.self)'")
        }
    }
}
