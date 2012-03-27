# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# guard 'rspec', :version => 2 do
#   watch(%r{^spec/.+_spec\.rb$})
#   watch(%r{^lib/goliath/(.+)\.rb$})     { |m| "spec/unit/#{m[1]}_spec.rb" }
# end

class Guard::JSInit

  def call(guard_class, event, *args)
   to_append = File.read("assets/js/modules/initr.js") 
	File.open("public/js/app.js", "a") do |handle| 
		handle.puts to_append 
	end 

  end
end


# Recursively load all the sources from a given directory
guard 'stitch', :paths => [
	'assets/js/modules/models/'
],
:root => 'assets/js',
	:dependencies => [
	'assets/js/libs/underscore.js',
	'assets/js/libs/backbone.js',
	'assets/js/libs/json2.js',
	'assets/js/libs/bootstrap.js'
],
   :output => 'public/js/app.js' do
  watch(%r{^.+\.(js|coffee)$})
  callback(JSInit.new, [:run_on_change_end]) #{ puts  }#File.read('assets/js/modules/initr.js') }

end


# guard 'stitch', :paths => [
# ], :output => 'public/js/modules.js' do
#   watch(%r{^.+\.(js|coffee)$})
# end

# Recursively resolve sources from a given file,
# dynamically resolving its dependencies
# guard 'stitch', :files => [
# 	'assets/js/initr.js'
# ], :output => 'public/js/app.js' do
#   watch(%r{^.+\.(js|coffee)$})
# end