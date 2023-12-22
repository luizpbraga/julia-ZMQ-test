import ZMQ

function subscriber()
  ctx = ZMQ.Context()
  let socket = ZMQ.Socket(ctx, ZMQ.SUB)
    # subscriber se connecta ao addr do publisher
    ZMQ.connect(socket, "tcp://localhost:5555")

    # O subscriber se inscrever para receber todas as msgs
    ZMQ.subscribe(socket, "")

    while true
      msg = ZMQ.recv(socket)
      println("recebido: ", String(msg))
    end

    ZMQ.term(ctx)
  end
end

@async subscriber()

