PROJ := hello

CC := $(shell xcrun --sdk iphoneos -f clang)
SDKROOT := $(shell xcrun --sdk iphoneos --show-sdk-path)
ARCH := arm64

SRCDIR := ./src
#LIBDIR := ./lib
BUILDDIR := ./build
TARGETDIR := ./out
TARGET := $(TARGETDIR)/$(PROJ).a

SRCEXT := cpp
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))

# SRCEXT2 := cc
# SOURCES2 := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT2))
# OBJECTS2 := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES2:.$(SRCEXT2)=.o))


CFLAGS := -arch $(ARCH) -isysroot $(SDKROOT) -miphoneos-version-min=7.0 -fembed-bitcode 
#LDFLAGS := -arch $(ARCH) -isysroot $(SDKROOT)

$(TARGET): $(OBJECTS)
	@mkdir -p $(TARGETDIR)
	@echo "Build shared library..."
	ar rcs $@ $^
	ranlib $@
	#$(CC) $(CFLAGS) $^ -o $(TARGET) $(LIB)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@echo "Compile ...$<"
	@mkdir -p $(BUILDDIR)
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -rf $(BUILDDIR)
	rm -rf $(TARGETDIR)
