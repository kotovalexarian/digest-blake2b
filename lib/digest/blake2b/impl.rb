# frozen_string_literal: true

module Digest
  class Blake2b
    if RUBY_PLATFORM =~ /^x86_64/
      IMPL = 'sse'
    else
      IMPL = 'ref'
    end
  end
end
