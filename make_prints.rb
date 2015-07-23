
Dir.foreach('_posts') do |item|
	if ( item =~ /(.*)markdown(.*)/ and not item =~ /(.*)print(.*)/ )
		puts item
		full_path_to_read = File.expand_path('_posts/'+item)
		item = item[/(.*)(?=\.markdown)/]
		full_path_to_write = File.expand_path('_posts/'+item+'-print.markdown')
		puts full_path_to_write
		File.open(full_path_to_read) { |source_file|
		  contents = source_file.read
		  contents.gsub!(/layout\: post/, 'layout: print')
		  contents.gsub!(/categories\: medicine/, 'categories: print')
		  File.open(full_path_to_write, "w+") { |f| f.write(contents) }
		}
	end
end






