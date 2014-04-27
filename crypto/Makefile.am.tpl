include $(top_srcdir)/Makefile.am.common

AM_CPPFLAGS += -I$(top_srcdir)/crypto/asn1
AM_CPPFLAGS += -I$(top_srcdir)/crypto/evp
AM_CPPFLAGS += -I$(top_srcdir)/crypto/modes

lib_LTLIBRARIES = libcrypto.la

libcrypto_la_LDFLAGS = -version-info 1:1:0

libcrypto_la_SOURCES =
if NO_STRLCAT
libcrypto_la_SOURCES += compat/strlcat.c
endif
if NO_STRLCPY
libcrypto_la_SOURCES += compat/strlcpy.c
endif
if NO_REALLOCARRAY
libcrypto_la_SOURCES += compat/reallocarray.c
endif
if NO_BZERO
libcrypto_la_SOURCES += compat/bzero.c
endif
libcrypto_la_SOURCES += compat/arc4random.c
libcrypto_la_SOURCES += compat/explicit_bzero.c
# disable cryptodev for all OSes
libcrypto_la_SOURCES += compat/hw_cryptodev.c
libcrypto_la_SOURCES += compat/b_print.c

noinst_HEADERS = des/ncbc_enc.c
