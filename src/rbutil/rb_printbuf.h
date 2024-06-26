/*
 * $Id: printbuf.h,v 1.4 2006/01/26 02:16:28 mclark Exp $
 *
 * Copyright (c) 2004, 2005 Metaparadigm Pte. Ltd.
 * Michael Clark <michael@metaparadigm.com>
 *
 * This library is free software; you can redistribute it and/or modify
 * it under the terms of the MIT license. See COPYING for details.
 *
 *
 * Copyright (c) 2008-2009 Yahoo! Inc.  All rights reserved.
 * The copyrights to the contents of this file are licensed under the MIT License
 * (http://www.opensource.org/licenses/mit-license.php)
 */

#ifndef _printbuf_h_
#define _printbuf_h_

 #include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

struct printbuf {
  char *buf;
  size_t bpos;
  size_t size;
};

extern struct printbuf*
printbuf_new(struct printbuf* pb);

/* As an optimization, printbuf_memappend_fast is defined as a macro
 * that handles copying data if the buffer is large enough; otherwise
 * it invokes printbuf_memappend_real() which performs the heavy
 * lifting of realloc()ing the buffer and copying data.
 * Your code should not use printbuf_memappend directly--use
 * printbuf_memappend_fast instead.
 */
extern int
printbuf_memappend(struct printbuf *p, const char *buf, int size);

#define printbuf_memappend_fast(p, bufptr, bufsize)          \
do {                                                         \
  if ((p->size - p->bpos) > bufsize) {                       \
    memcpy(p->buf + p->bpos, (bufptr), bufsize);             \
    p->bpos += bufsize;                                      \
    p->buf[p->bpos]= '\0';                                   \
  } else {  printbuf_memappend(p, (bufptr), bufsize); }      \
} while (0)

/* Same as printbuf_memappend, buf it will escape JSON chars ('\', '"', and
  control codes <U+0020) */
int printbuf_memappend_escaped(struct printbuf *p, const char *buf, int size);

#define printbuf_memappend_fast_str(p, bufptr) printbuf_memappend_fast(p, bufptr, strlen(bufptr))

static size_t printbuf_memappend_fast_n16(struct printbuf *kafka_line_buffer,const unsigned char value)
  __attribute__((unused));
static size_t printbuf_memappend_fast_n16(struct printbuf *kafka_line_buffer,const unsigned char value){
  static const char *hexbuf = "0123456789abcdef";
  printbuf_memappend_fast(kafka_line_buffer,&hexbuf[(value & 0xf0)>>4],1);
  printbuf_memappend_fast(kafka_line_buffer,&hexbuf[(value & 0x0f)],1);
  return 2;
}

#define printbuf_length(p) ((p)->bpos)

/**
 * Set len bytes of the buffer to charvalue, starting at offset offset.
 * Similar to calling memset(x, charvalue, len);
 *
 * The memory allocated for the buffer is extended as necessary.
 *
 * If offset is -1, this starts at the end of the current data in the buffer.
 */
extern int
printbuf_memset(struct printbuf *pb, int offset, int charvalue, int len);

extern int
sprintbuf(struct printbuf *p, const char *msg, ...);

extern void
printbuf_reset(struct printbuf *p);

extern void
printbuf_free(struct printbuf *p);

#ifdef __cplusplus
}
#endif

#endif
