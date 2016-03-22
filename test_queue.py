from cffi import FFI
import subprocess

# build with
# g++ -dynamiclib  -DSTAND_ALONE -o queue.dylib queue.c

header = "queue.h"
ffi = FFI()
ffi.cdef(subprocess.Popen(['cc', '-E', '-DQUEUE_API=', '-DQUEUE_NO_INCLUDES', header],
                          stdout=subprocess.PIPE).communicate()[0])
lib = ffi.dlopen('queue.dylib')

size = 13
buf = ffi.new("uint32_t[]", size)
q = ffi.new("queue_t *")
lib.queue_init(q, buf, size)

for i in range(45):
    lib.queue_put(q, i)

val = ffi.new("uint32_t *")

vals = []
has_elems = True
while has_elems:
    if lib.queue_get(q, val):
        vals.append(val[0])
    else:
        has_elems = False

print vals
