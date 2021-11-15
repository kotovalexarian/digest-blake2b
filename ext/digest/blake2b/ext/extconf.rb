require 'mkmf'
$CFLAGS += ' -std=c99'
create_makefile 'digest/blake2b/ext'
