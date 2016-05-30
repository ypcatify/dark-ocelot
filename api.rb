class API < Sinatra::Base
  helpers Sinatra::Param

  get '/' do
    param :url, String, required: true
    kit = PDFKit.new(params[:url])
    temp_file = Tempfile.new('pdf-from-url')
    kit.to_file(temp_file.path)
    send_file temp_file, type: 'application/pdf'
    temp_file.close
    temp_file.unlink
  end
end
