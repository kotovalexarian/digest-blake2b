# frozen_string_literal: true

require 'mkmf'

$CFLAGS += ' -std=c99 -pedantic -Wall -Wextra'

create_makefile 'digest/blake2b/ref'
