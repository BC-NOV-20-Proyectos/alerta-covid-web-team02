class TicketController < ApplicationController
    def show 
        @ticket = Ticket.last
        @code = @ticket.code
    
        @qrcode = RQRCode::QRCode.new(@code)
    
        @svg = @qrcode.as_svg(
          offset:0,
          color: '000',
          shape_rendering: 'crispEdges',
          module_size: 6
        )
    end
end
