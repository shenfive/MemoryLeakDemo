//
//  ServerClient.swift
//  MemoryLeakDemo
//
//  Created by 申潤五 on 2024/7/11.
//

import Foundation
class Server {
    var clients: [Client] = []
    func add(client: Client) {
        self.clients.append(client)
    }
}

class Client {
    // weak var server: Server! // 較好的寫法
    var server: Server
    init (server: Server) {
        self.server = server
    }
}
