# frozen_string_literal: true

require 'mkmf'

$CFLAGS += ' -std=c99 -pedantic -Wall -Wextra'

if RUBY_PLATFORM =~ /^x86_64/
  $CPPFLAGS += ' -DIMPL_SSE'
  $CFLAGS += ' -Wno-long-long'
else
  $CPPFLAGS += ' -DIMPL_REF'
end

create_makefile 'digest/blake2b/ext'
