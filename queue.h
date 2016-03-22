#ifndef QUEUE_H
#define QUEUE_H

#ifndef QUEUE_API
#ifdef _WIN32
#     if defined(QUEUE_BUILD_SHARED) /* build dll */
#         define QUEUE_API __declspec(dllexport)
#     elif defined(QUEUE_BUILD_STATIC) /* use dll */
#         define QUEUE_API __declspec(dllimport)
#     else /* static library */
#         define QUEUE_API
#     endif
#  else
#     if __GNUC__ >= 4
#         define QUEUE_API __attribute__((visibility("default")))
#     else
#         define QUEUE_API
#     endif
#  endif
#endif

#ifndef QUEUE_NO_INCLUDES
#include <stdlib.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

typedef struct queue_s {
  uint32_t *elements;
  size_t size;
  uint32_t volatile *tail;
  uint32_t volatile *head;
} queue_t;

typedef struct queue_t*         QueueT;

#define QUEUE_DEFINE(n, s)                                              \
  uint32_t n##_elems[(s + 1)];                                          \
  queue_t n = {n##_elems, s, &n##_elems[0], &n##_elems[0]}

void queue_init(queue_t *const q, uint32_t *const buf, const size_t size);
bool queue_put(queue_t *const q, const uint32_t elem);
bool queue_get(queue_t *const q, uint32_t *out_elem);

#ifdef __cplusplus
}
#endif

#endif // QUEUE_H
