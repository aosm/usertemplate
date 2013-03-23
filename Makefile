#
# THESE PERMISSIONS ARE LARGELY IGNORED
# CONTACT B&I IF YOU NEED TO CHANGE FINAL PERMISSIONS
#
# usertemplate makefile
# 
# RC builds must Respect the following target:
#	install:
#	installsrc:
#	installhdrs:
#	clean:
#

include $(MAKEFILEPATH)/project/platform.make 
############################################
# Variables
#

DESTINATION = 	 "$(DSTROOT)$(SYSTEM_LIBRARY_DIR)/User\ Template/"
NONLOCALIZED = "$(DSTROOT)$(SYSTEM_LIBRARY_DIR)/User\ Template/"
############################################

install:
	# Create the Destination
	umask 0
	mkdir -p "$(DESTINATION)"
	chmod -R 700 "$(DESTINATION)"

	# Install Files
	ditto "$(SRCROOT)" "$(DESTINATION)"

	# Correct Permissions
	chown -R root:admin "$(DESTINATION)" # Set the Owner
	chmod -R 755 "$(DESTINATION)" # Start with 755 
	chmod 700 "$(DESTINATION)" # We need to set /Sytem/Library/User Template to 700

	chmod 700 "$(DESTINATION)/English.lproj/Library" "$(DESTINATION)/English.lproj/Documents" "$(DESTINATION)/English.lproj/Library/Favorites" "$(DESTINATION)/English.lproj/Movies" "$(DESTINATION)/English.lproj/Music" "$(DESTINATION)/English.lproj/Pictures" "$(DESTINATION)/Non_localized/Library" "$(DESTINATION)/Non_localized/Library/Preferences" "$(DESTINATION)/English.lproj/Desktop" "$(DESTINATION)/Non_localized/Library/Preferences" "$(DESTINATION)/English.lproj/Downloads" "$(DESTINATION)/Non_localized/Library/Logs"

	chmod -R 700 "$(DESTINATION)/English.lproj/Library/Preferences" "$(DESTINATION)/English.lproj/Library/Compositions" "$(DESTINATION)/English.lproj/Library/Keyboard Layouts" "$(DESTINATION)/English.lproj/Library/Input Methods" # Set Preferences to 700
	chmod 733 "$(DESTINATION)/English.lproj/Public/Drop Box" # Drop Box gets 733

	chmod 600 "$(DESTINATION)/Non_localized/Library/Preferences/com.apple.scheduler.plist" "$(DESTINATION)/English.lproj/Library/Preferences/.GlobalPreferences.plist" "$(DESTINATION)/English.lproj/Library/Preferences/com.apple.symbolichotkeys.plist"

	chmod 644 "$(DESTINATION)/English.lproj/Library/FontCollections/Fixed Width.collection" "$(DESTINATION)/English.lproj/Library/FontCollections/Traditional.collection" "$(DESTINATION)/English.lproj/Library/FontCollections/Fun.collection" "$(DESTINATION)/English.lproj/Library/FontCollections/Modern.collection" "$(DESTINATION)/English.lproj/Library/FontCollections/PDF.collection" "$(DESTINATION)/English.lproj/Library/FontCollections/Web.collection" "$(DESTINATION)/English.lproj/.CFUserTextEncoding" "$(DESTINATION)/English.lproj/Public/.localized" "$(DESTINATION)/English.lproj/Sites/.localized" "$(DESTINATION)/English.lproj/Public/Drop Box/.localized" "$(DESTINATION)/English.lproj/Library/.localized" "$(DESTINATION)/English.lproj/Desktop/.localized" "$(DESTINATION)/English.lproj/Documents/.localized" "$(DESTINATION)/English.lproj/Movies/.localized" "$(DESTINATION)/English.lproj/Downloads/.localized" "$(DESTINATION)/English.lproj/Music/.localized" "$(DESTINATION)/English.lproj/Pictures/.localized" "$(DESTINATION)/English.lproj/Library/Compositions/.localized" "$(DESTINATION)/English.lproj/Library/Input Methods/.localized"

	chmod 666 "$(DESTINATION)/English.lproj/Sites/images/apache_pb.gif" "$(DESTINATION)/English.lproj/Sites/images/macosxlogo.png" "$(DESTINATION)/English.lproj/Sites/images/web_share.gif" "$(DESTINATION)/English.lproj/Sites/images/gradient.jpg"
	chmod 666 "$(DESTINATION)/English.lproj/Sites/index.html" "$(DESTINATION)/Non_localized/Sites/images/apache_pb.gif" "$(DESTINATION)/Non_localized/Sites/images/macosxlogo.png" "$(DESTINATION)/Non_localized/Sites/images/web_share.gif" "$(DESTINATION)/Non_localized/Sites/images/gradient.jpg"
	
	# Make sure that the About Stacks.pdf and About Downloads.pdf are not executable
	chmod 600 "$(DESTINATION)/English.lproj/Documents/About Stacks.pdf" "$(DESTINATION)/English.lproj/Downloads/About Downloads.pdf"
	
	# Set the "hide extension" attribute bit of the About Stacks.pdf and About Downloads.pdf files
	/Developer/Tools/SetFile -a E "$(DESTINATION)/English.lproj/Documents/About Stacks.pdf" "$(DESTINATION)/English.lproj/Downloads/About Downloads.pdf"

	chmod 700 "$(DESTINATION)" # We need to set /Sytem/Library/User Template to 700
	chown root:admin "$(DESTINATION)" # Set the Owner
	echo "##################################"
	ls -ald "$(DESTINATION)"
	echo "##################################"

	
# Set Symbolic Links
	ln -s "/Library/Application Support/Apple/iChat Icons/" "$(DESTINATION)English.lproj/Pictures/iChat Icons"
      #	ln -s ../.. "$(DESTINATION)English.lproj/Library/Favorites/Home"

	rm $(DSTROOT)$(SYSTEM_LIBRARY_DIR)/User\ Template/makefile*

installsrc:
	ditto . $(SRCROOT)
	rm -f $(SRCROOT)/CVSVersionInfo.txt
	find $(SRCROOT) -name '.tmpfile' -a -exec rm -f '{}' \;
	find $(SRCROOT) -name '.nfs*' -o -name '.svn' -a -exec echo '{}' \; -a -exec rm -rf '{}' \; -prune
	# chown -R root:wheel $(SRCROOT)

clean::

installhdrs::
