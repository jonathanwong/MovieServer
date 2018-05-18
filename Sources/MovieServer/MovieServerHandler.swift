//
//  MovieServerHandler.swift
//  MovieServer
//
//  Created by Jonathan Wong on 5/16/18.
//

import Foundation
import NIO

class MovieServerHandler: ChannelInboundHandler {
    typealias InboundIn = ByteBuffer
    typealias OutboundOut = ByteBuffer
    
    func channelRead(ctx: ChannelHandlerContext, data: NIOAny) {
        // unwrap the NIOAny data to a ByteBuffer
        var buffer = unwrapInboundIn(data)
        
        // get the number of bytes that are readable
        let readableBytes = buffer.readableBytes
        
        // read the number of readable bytes from the ByteBuffer
        guard let received = buffer.readBytes(length: readableBytes) else {
            return
        }
        
        let receivedData = Data(bytes: received, count: received.count)
        
        do {
            // deserialize the received Data object
            let movie = try Movie(serializedData: receivedData)
            print("Received: \(movie)")

            // do something useful with the data...
        } catch let error {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func channelReadComplete(ctx: ChannelHandlerContext) {
        ctx.flush()
    }
    
    func errorCaught(ctx: ChannelHandlerContext, error: Error) {
        print("error: \(error.localizedDescription)")
        ctx.close(promise: nil)
    }
}
