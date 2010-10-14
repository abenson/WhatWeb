##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Fixed regex to return multiple frames
##
Plugin.define "Frame" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-13
version "0.2"
description "This plugin detects instances of frame and iframe HTML elements and grabs the URL."

# 213 results for "your browser does not support frames" @ 2010-10-13
examples %w|
crowd.webhop.org
fleckerika.sytes.net
frenchtownalive.com
movies.sky.com
tv.sky.com
bricktech.blogspot.com
livestreamingofsoccer.blogspot.com
www.dialogclassic.com
www.nasa.gov/externalflash/name_ISS/
www.ornatopia.com
www.usbornebooksandmore.com/?NewID=NEW
|

# URL Extraction
def passive
	m=[]

	if @body =~ /<[\s]*[i]*frame[^src]+src[\s]*=[\s]*[\"|\']*([^>^\"]+)/i
		version=@body.scan(/<[\s]*[i]*frame[^src]+src[\s]*=[\s]*[\"|\']*([^>^\"]+)/i)
		m << { :version=>version }
	end

	m

end

end
