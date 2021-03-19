require 'rqrcode'
class QrController < ApplicationController
    
    def self.create(txt_qr)
        
        @qrcode = RQRCode::QRCode.new(txt_qr)

        @png = @qrcode.as_png( 
            bit_depth: 1, 
            border_modules: 4, 
            color_mode: ChunkyPNG::COLOR_GRAYSCALE, 
            color: 'black', 
            file: nil, 
            fill: 'white', 
            module_px_size: 6, 
            resize_exactly_to: false, 
            resize_gte_to: false, 
            size: 120 
        )
        id_place = txt_qr.split("|")[1]
        Base64.encode64(@png.to_s)        
        puts @png
    end
    
end
