let server = MovieServer(host: "localhost", port: 3010)
do {
    try server.start()
} catch let error {
    print("Error: \(error.localizedDescription)")
    server.stop()
}
