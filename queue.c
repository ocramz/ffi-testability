/*
**
** A thread-safe (for 2 threads) implementation of a queue. Based on the
** implementation from the book Embedded Systems, by Jonathan W. Valvano,
** chapter 3, page 130.

** Adapted from
** https://gist.github.com/agarie/3951358
**
*/
#include "queue.h"

void queue_init(queue_t *const q, uint32_t *const buf, const size_t size) {
  q->size = size;
  q->elements = buf;
  q->tail = q->head = &q->elements[0];
}

bool queue_put(queue_t *const q, const uint32_t elem) {
  uint32_t volatile * next_tail;
  next_tail = q->tail + 1;
  if (next_tail >= &q->elements[q->size]) /* Wrap around. */
    next_tail = &q->elements[0];

  if (next_tail == q->head)
    return false;

  *q->tail = elem;
  q->tail = next_tail;
  return true;
}

bool queue_get(queue_t *const q, uint32_t *out_elem) {
  if (q->tail == q->head) /* Queue is empty. */
    return false;

  *out_elem = *(q->head++);
  if (q->head == &q->elements[q->size]) /* Wrap around. */
    q->head = &q->elements[0];

  return true;
}

QUEUE_DEFINE(my_queue, 13);
