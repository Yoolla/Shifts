//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation
import Swinject

protocol DependencyRegisterer {
    func register<T>(_ dependency: T.Type, qualifier: String?, scope : ObjectScope, implementation: @escaping (DependencyResolver)->T)
}

protocol DependencyResolver {
    func resolve<T>(_ dependency: T.Type, qualifier: String?) -> T
    func resolveOptional<T>(_ dependency: T.Type, qualifier: String?) -> T?
}

