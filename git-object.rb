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
content = "what is up, doc?"

#git blob header
header = "blob #{content.bytesize}\0"

#header and content for SHA-1 value
store = header + content

#calculate the SHA-1 value 
sha1 = Digest::SHA1.hexdigest(store)

#since git uses ZLib to compress content
zlib_content = Zlib::Deflate.deflate(store)

#create the git object path from the SHA-1 hash
#path should be .get/objects/bd/9dbf5aae1a3862dd1526723246b20206e5fc37
path = '.git/objects/' + sha1[0,2] + '/' + sha1[2,38]

#create the directory if it does not exist
FileUtils.mkdir_p(File.dirname(path))

#write the zlib compressed content
File.open(path, 'w') { |f| f.write zlib_content }

=begin
  Steps to check the newly created blob from this script:
  git cat-file -t bd9dbf5aae1a3862dd1526723246b20206e5fc37

  To create the same blob with the same sha1 checksum, do the following at the CLI:
  echo -n "what is up, doc?" | git hash-object --stdin
=end