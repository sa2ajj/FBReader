include $(ROOTDIR)/makefiles/platforms.mk

DUMMY_SECTIONS = \
	-DSTL_SECTION="" \
	-DXML_SECTION="" \
	-DFS_SECTION="" \
	-DOPTIONS_SECTION="" \
	-DUTIL_SECTION="" \
	-DDIALOG_SECTION="" \
	-DIMAGE_SECTION="" \
	-DAPPLICATION_SECTION="" \
	-DMODEL_SECTION="" \
	-DVIEW_SECTION="" \
	-DZLVIEW_SECTION="" \
	-DFB_VIEW_SECTION="" \
	-DTEXT_STYLE_SECTION="" \
	-DHYPHENATION_SECTION="" \
	-DFORMATS_SECTION="" \
	-DFB_SECTION="" \
	-DFB_DIALOG_SECTION=""

MAKE = ROOTDIR=$(ROOTDIR) make

ifeq "$(TARGET_ARCH)" "zaurus-qtopia"
	QTDIR=/opt/Qtopia/sharp
	TOOLSDIR = /opt/Embedix/tools/arm-linux/bin
	MOC = $(QTDIR)/bin/moc
	RM = rm -rvf
	RM_QUIET = rm -rf
	QTINCLUDE = -I $(QTDIR)/include
	QTLIBS = -L $(QTDIR)/lib -lqte -lqpe
	CC = $(TOOLSDIR)/gcc
	AR = $(TOOLSDIR)/ar rsu
	LD = $(TOOLSDIR)/g++
	STRIP = $(TOOLSDIR)/strip

	CFLAGS = -pipe $(DUMMY_SECTIONS) -DQT_QWS_EBX -DQT_QWS_CUSTOM -DQWS -fno-exceptions -fno-rtti -Wall -Wno-ctor-dtor-privacy -W -O3 -DNO_DEBUG
	LDFLAGS = -O3
	DEPGEN = $(CC) -MM

	EXTERNALINCLUDE = -I $(ROOTDIR)/external/include
	EXPATLIBS = -L $(ROOTDIR)/external/lib -lexpat
	ENCALIBS = -L $(ROOTDIR)/external/lib -lenca
endif

ifeq "$(TARGET_ARCH)" "zaurus-pdaxrom-qt"
	BASEDIR = /opt/arm/3.3.2-vfp
	CC = $(BASEDIR)/bin/armv5tel-linux-gcc
	AR = $(BASEDIR)/bin/armv5tel-linux-ar rsu
	LD = $(BASEDIR)/bin/armv5tel-linux-g++
	STRIP = $(BASEDIR)/bin/armv5tel-linux-strip

	DEPGEN = $(CC) -MM
	CFLAGS = -pipe $(DUMMY_SECTIONS) -fno-exceptions -fno-rtti -Wall -Wno-ctor-dtor-privacy -W -O3 -DNO_DEBUG
	LDFLAGS = -O3
	MOC = $(BASEDIR)/bin/moc
	RM = rm -rvf
	RM_QUIET = rm -rf
	USRDIR = $(BASEDIR)/armv5tel-cacko-linux
	QTINCLUDE = -I $(USRDIR)/qt/include
	QTLIBS = -L $(USRDIR)/qt/lib -lqt-mt -L $(USRDIR)/X11R6/lib -lXext -lXrender -lXrandr -lXcursor -lX11 -lXft -lSM -lICE
	EXPATLIBS = -lexpat
	ENCALIBS = -lenca
endif

ifeq "$(TARGET_ARCH)" "zaurus-pdaxrom-gtk"
	BASEDIR = /opt/arm/3.3.2-vfp
	CC = $(BASEDIR)/bin/armv5tel-linux-gcc
	AR = $(BASEDIR)/bin/armv5tel-linux-ar rsu
	LD = $(BASEDIR)/bin/armv5tel-linux-g++
	STRIP = $(BASEDIR)/bin/armv5tel-linux-strip

	DEPGEN = $(CC) -MM
	CFLAGS = -pipe $(DUMMY_SECTIONS) -fno-exceptions -fno-rtti -Wall -Wno-ctor-dtor-privacy -W -O3 -DNO_DEBUG
	LDFLAGS = -O3
	RM = rm -rvf
	RM_QUIET = rm -rf
	USRDIR = $(BASEDIR)/armv5tel-cacko-linux
	INCDIR = $(USRDIR)/include
	GTKINCLUDE = -I$(INCDIR)/libxml2 -I$(INCDIR)/libglade-2.0 -I$(INCDIR)/gtk-2.0 -I$(USRDIR)/lib/gtk-2.0/include -I$(USRDIR)/X11R6/include -I$(INCDIR)/atk-1.0 -I$(INCDIR)/pango-1.0 -I$(INCDIR)/freetype2 -I$(INCDIR)/glib-2.0 -I$(USRDIR)/lib/glib-2.0/include
	GTKLIBS = -L $(USRDIR)/lib -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgdk_pixbuf-2.0 -lm -lpangoxft-1.0 -lpangox-1.0 -lpango-1.0 -lgobject-2.0 -lgmodule-2.0 -ldl -lglib-2.0 -lm -lgmodule-2.0 -ldl -lgthread-2.0 -L $(USRDIR)/X11R6/lib -lXext -lXrender -lXrandr -lXcursor -lX11 -lXft -lSM -lICE
	EXPATLIBS = -lexpat
	ENCALIBS = -lenca
endif

ifeq "$(TARGET_ARCH)" "desktop-qt"
	CC = gcc
	AR = ar rsu
	LD = g++
	STRIP = strip

	DEPGEN = $(CC) -MM
	CFLAGS = -pipe $(DUMMY_SECTIONS) -fno-exceptions -fno-rtti -Wall -Wno-ctor-dtor-privacy -W -O3 -DNO_DEBUG
	LDFLAGS = -O3
	MOC = moc-qt3
	RM = rm -rvf
	RM_QUIET = rm -rf
	QTINCLUDE = -I /usr/include/qt3
	QTLIBS = -lqt-mt
	EXPATLIBS = -lexpat
	ENCALIBS = -lenca
endif

ifeq "$(TARGET_ARCH)" "desktop-gtk"
	CC = gcc
	AR = ar rsu
	LD = g++
	STRIP = strip

	DEPGEN = $(CC) -MM
	CFLAGS = -pipe $(DUMMY_SECTIONS) -fno-exceptions -fno-rtti -Wall -Wno-ctor-dtor-privacy -W -O3 -DNO_DEBUG
	LDFLAGS = -O3
	RM = rm -rvf
	RM_QUIET = rm -rf
	GTKINCLUDE = -I/usr/include/libxml2 -I/usr/include/libglade-2.0 -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/X11R6/include -I/usr/include/atk-1.0 -I/usr/include/pango-1.0 -I/usr/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include
	GTKLIBS = -lz -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgdk_pixbuf-2.0 -lm -lpangoxft-1.0 -lpangox-1.0 -lpango-1.0 -lgobject-2.0 -lgmodule-2.0 -ldl -lglib-2.0 -lm -lgmodule-2.0 -ldl -lgthread-2.0
	EXPATLIBS = -lexpat
	ENCALIBS = -lenca
endif

ifeq "$(TARGET_ARCH)" "maemo"
	CC = gcc
	AR = ar rsu
	LD = g++
	STRIP = strip

	DEPGEN = $(CC) -MM
	CFLAGS = -pipe $(DUMMY_SECTIONS) -fno-exceptions -fno-rtti -Wall -Wno-ctor-dtor-privacy -W -O3 -DNO_DEBUG
	LDFLAGS = -O3
	RM = rm -rvf
	RM_QUIET = rm -rf
	GTKINCLUDE = -I/usr/include/libxml2 -I/usr/include/libglade-2.0 -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/X11R6/include -I/usr/include/atk-1.0 -I/usr/include/pango-1.0 -I/usr/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/hildon-lgpl
	GTKLIBS = -lz -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgdk_pixbuf-2.0 -lm -lpangoxft-1.0 -lpangox-1.0 -lpango-1.0 -lgobject-2.0 -lgmodule-2.0 -ldl -lglib-2.0 -lm -lgmodule-2.0 -ldl -lgthread-2.0 -lhildonlgpl
	EXPATLIBS = -lexpat
	ENCALIBS = -lenca
endif

ifeq "$(TARGET_ARCH)" "palm"
	CC = m68k-palmos-g++
	AR = m68k-palmos-ar rsu
	LD = m68k-palmos-g++
	STRIP = m68k-palmos-strip

	DEPGEN = $(CC) -MM -DPALM_TEMPORARY
	CFLAGS = \
		-DSTL_SECTION="__attribute__ ((section(\"sec0\")))" \
		-DXML_SECTION="__attribute__ ((section(\"sec2\")))" \
		-DFS_SECTION="__attribute__ ((section(\"sec2\")))" \
		-DOPTIONS_SECTION="__attribute__ ((section(\"sec1\")))" \
		-DUTIL_SECTION="__attribute__ ((section(\"sec1\")))" \
		-DDIALOG_SECTION="__attribute__ ((section(\"sec1\")))" \
		-DIMAGE_SECTION="__attribute__ ((section(\"sec1\")))" \
		-DAPPLICATION_SECTION="__attribute__ ((section(\"sec1\")))" \
		-DZLVIEW_SECTION="__attribute__ ((section(\"sec2\")))" \
		-DVIEW_SECTION="__attribute__ ((section(\"sec3\")))" \
		-DMODEL_SECTION="__attribute__ ((section(\"sec6\")))" \
		-DFB_VIEW_SECTION="__attribute__ ((section(\"sec4\")))" \
		-DFB_SECTION="__attribute__ ((section(\"sec4\")))" \
		-DTEXT_STYLE_SECTION="__attribute__ ((section(\"sec3\")))" \
		-DHYPHENATION_SECTION="__attribute__ ((section(\"sec5\")))" \
		-DFORMATS_SECTION="__attribute__ ((section(\"sec5\")))" \
		-DFB_DIALOG_SECTION="__attribute__ ((section(\"sec6\")))" \
		-DPALM_TEMPORARY \
		-DUSE_OWN_XML_PARSER \
		-pipe -fno-exceptions -fno-rtti -fno-inline -Wall -Wno-ctor-dtor-privacy -W -Wno-non-template-friend -O3
	LDFLAGS = -O3
	RM = rm -rvf
	RM_QUIET = rm -rf
 	EXTERNALINCLUDE = -I $(ROOTDIR)/zlibrary/palm/pseudostl -I $(ROOTDIR)/palm-external
 	EXTERNALLIBS = # $(ROOTDIR)/palm-external/SysZLib.prc
	#EXPATLIBS = -lexpat
	#ENCALIBS = -lenca
endif

ZDIR = $(ROOTDIR)/zlibrary
ZINCLUDE = -I $(ROOTDIR)/zlibrary/include
