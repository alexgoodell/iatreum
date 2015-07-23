require 'pdfkit'


Dir.foreach('_posts') do |item|
	if ( item =~ /(.*)print(.*)/ )
		puts item
		item = item[/(.*)(?=\.markdown)/]
		puts item
		item_non_print = item.gsub("","")
		puts "Converting " + item_non_print + "..."
		item = item[11,item.length]
		item
		filename = 'http://127.0.0.1:4000/'+ item +'.html'
		puts "Getting " + filename
		kit = PDFKit.new(filename)
		file = kit.to_file('pdfs/'+item.gsub("-print","")+".pdf")
		puts "Converted"
	end
  # do work on real items
end

# # PDFKit.new takes the HTML and any options for wkhtmltopdf
# # run `wkhtmltopdf --extended-help` for a full list of options
# kit = PDFKit.new(html, :page_size => 'Letter')
# kit.stylesheets << '/path/to/css/file'

# # Get an inline PDF
# pdf = kit.to_pdf

# # Save the PDF to a file


# PDFKit.new can optionally accept a URL or a File.
# Stylesheets can not be added when source is provided as a URL of File.

# kit = PDFKit.new(File.new('/path/to/html'))


# Add any kind of option through meta tags
# PDFKit.new('<html><head><meta name="pdfkit-page_size" content="Letter"')
# PDFKit.new('<html><head><meta name="pdfkit-cookie cookie_name1" content="cookie_value1"')
# PDFKit.new('<html><head><meta name="pdfkit-cookie cookie_name2" content="cookie_value2"')