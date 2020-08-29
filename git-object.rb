=begin
  Steps before running this script to demo creating a git blob object via this script:
  1. mkdir testdir
  2. cd testdir
  3. git init
  4. now, run this script in the testdir directory
=end

#references
require 'digest/sha1'
require 'zlib'
require 'fileutils'

#git blob content
content = "File.txt v1"

#git blob header
header = "blob #{content.bytesize}\0"

#header and content for SHA-1 value
store = header + content

#calculate the SHA-1 value 
sha1 = Digest::SHA1.hexdigest(store)

#since git uses ZLib to compress content
zlib_content = Zlib::Deflate.deflate(store)

#create the git object path from the SHA-1 hash
#path should be .get/objects/03/cdcf9d586cf93a458f10fa7f2581fb00125883
path = '.git/objects/' + sha1[0,2] + '/' + sha1[2,38]

#create the directory if it does not exist
FileUtils.mkdir_p(File.dirname(path))

#write the zlib compressed content
File.open(path, 'w') { |f| f.write zlib_content }

=begin
  Steps to check the newly created blob from this script:
  git cat-file -t 03cdcf9d586cf93a458f10fa7f2581fb00125883

  To create the same blob with the same sha1 checksum, do the following at the CLI:
  echo -n "File.txt v1" | git hash-object --stdin
=end