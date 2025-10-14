//
//  DIContainer.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 04/10/2025.
//

import Foundation

// MARK: - Dependency Container
final class DIContainer {
    // Singleton instance for self-initialization
    static let shared = DIContainer()
    
    private var dependencies: [String: Any] = [:]
    
    private init() {}
    
    // Register a dependency with a factory closure
    func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        let key = String(describing: type)
        dependencies[key] = factory
    }
    
    // Resolve a dependency
    func resolve<T>(_ type: T.Type) -> T? {
        let key = String(describing: type)
        if let factory = dependencies[key] as? () -> T {
            return factory()
        }
        return nil
    }
}

// MARK: - Property Wrapper for Injection
@propertyWrapper
struct Dependency<T> {
    private let container: DIContainer
    
    init(container: DIContainer = .shared) {
        self.container = container
    }
    
    var wrappedValue: T {
        guard let resolved = container.resolve(T.self) else {
            fatalError("Dependency \(T.self) not registered")
        }
        return resolved
    }
}

// MARK: - Extension for Dependency Registration
protocol DependencyRegisterable {}
extension DIContainer: DependencyRegisterable {}

extension DependencyRegisterable where Self == DIContainer {
    func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        DIContainer.shared.register(type, factory: factory)
    }
}
