# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require cloudinary
#= require turbolinks
#= require bootstrap-sprockets
#= require bootstrap
#= require_tree .

# When cloudinary file upload is done
$('document').ready () ->
	$('.cloudinary-fileupload').bind('cloudinarydone', (e, data) ->
		$('.preview').html $.cloudinary.image(data.result.public_id,
			format: data.result.format
			version: data.result.version
			crop: 'fill'
			width: 150
			height: 100
		)
		$('.image_public_id').val data.result.public_id
		true)

# Update bootstrap progress bar as file upload progresses
	$('.cloudinary-fileupload').bind 'fileuploadprogress', (e, data) ->
		progress = Math.round((data.loaded * 100.0) / data.total)
		$('#progress-bar').css('width', progress + '%')
		$('#progress-bar').html(progress + '% Done!')

