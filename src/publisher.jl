import ZMQ

function publisher()
  # cria a socket e o contexto
  ctx = ZMQ.Context()
  let socket = ZMQ.Socket(ctx, ZMQ.PUB)

    # o publisher faz o bind para que o 
    # subscriber se connecte
    ZMQ.bind(socket, "tcp://*:5555")

    println("Publisher iniciado na porta :5555")

    # enviar uma msg a casa segundo
    for i in 1:10
      msg = "Mensagem $i"

      #enviar a msg atravez do socket
      ZMQ.send(socket, msg)

      sleep(1)

    end

    ZMQ.term(ctx)
  end
end


@async publisher()
