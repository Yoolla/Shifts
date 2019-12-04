//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation
import Swinject

class DI: DependencyRegisterer, DependencyResolver {

    private let container = Container()
    static let shared = DI()

    private init() {
        initialSetup()
    }

    func register<T>(_ dependency: T.Type, qualifier: String? = nil, scope: ObjectScope = ObjectScope.container, implementation: @escaping (DependencyResolver) -> T) {
        if let qualifier = qualifier {
            container.register(dependency, name: qualifier, factory: { _ -> T in implementation(self) }).inObjectScope(scope)
        } else {
            container.register(dependency, factory: { _ -> T in implementation(self) }).inObjectScope(scope)
        }
    }

    func resolve<T>(_ dependency: T.Type, qualifier: String? = nil) -> T {
        if let qualifier = qualifier {
            guard let resolvedObject = container.resolve(dependency, name: qualifier) else {
                fatalError("can not resolve \(dependency)")
            }
            return resolvedObject
        } else {
            guard let resolvedObject = container.resolve(dependency) else {
                fatalError("can not resolve \(dependency)")
            }
            return resolvedObject
        }
    }

    func resolveOptional<T>(_ dependency: T.Type, qualifier: String?) -> T? {
        if let qualifier = qualifier {
            return container.resolve(dependency, name: qualifier)
        } else {
            return container.resolve(dependency)
        }
    }

}

extension DependencyResolver {
    // support for empty qualifier call for protocol
    func resolve<T>(_ dependency: T.Type) -> T {
        return resolve(dependency, qualifier: nil)
    }

    func resolveOptional<T>(_ dependency: T.Type) -> T? {
        return resolveOptional(dependency, qualifier: nil)
    }
}

extension DI {
    func initialSetup() {
        register(DatabaseServiceProtocol.self) { resolver in
            DatabaseService(shifts: DatabaseService.testShifts())
       }
    }
}

