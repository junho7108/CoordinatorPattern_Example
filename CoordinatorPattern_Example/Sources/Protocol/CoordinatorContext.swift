//
//  CoordinatorContext.swift
//  CoordinatorPattern_Example
//
//  Created by 태우 on 2021/01/17.
//

protocol CoordinatorContext {
    associatedtype T: Coordinator
    var coordinator: T? { get set }
}
