//
//  ModelLoader2.swift
//  Hackathon
//
//  Created by Ahmad Hallaq on 2/10/24.
//

import CoreML
import Path
import Models

class ModelLoader {
    static let models = Bundle.main.path(forResource: "last-model", ofType: "mlmodelc")
  static let lastCompiledModel = URL(fileURLWithPath: models!.string)
  
    static func load() async throws -> LanguageModel {
        // Load last model used (or the one we just compiled)
        return try LanguageModel.loadCompiled(url: lastCompiledModel, computeUnits: .cpuAndGPU)
    }
}
import Combine

extension LanguageModel: ObservableObject {}
