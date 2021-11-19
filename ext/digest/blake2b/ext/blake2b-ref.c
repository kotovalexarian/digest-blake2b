#ifdef IMPL_REF
#include "ref/blake2b-ref.c"
#endif

#ifdef IMPL_SSE
#include "sse/blake2b-ref.c"
#endif
