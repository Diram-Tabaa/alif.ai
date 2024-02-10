//
//  ChatMessage.swift
//  Hackathon
//
//  Created by Ammar Raza on 2/10/24.
//

import Foundation


struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isReceived: Bool // true for received, false for sent
}
