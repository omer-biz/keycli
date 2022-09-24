include config.mk

SRC    := $(wildcard ${SRCDIR}/*.c)
OBJ    := ${SRC:${SRCDIR}/%.c=${BUILDDIR}/%.o}

all: $(BIN)

$(BIN): $(OBJ) $(LIBARC)
	$(CC) -o $@ $(CFLAGS) $+

$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p ${@D}
	$(CC) $(CFLAGS) -c $< -o $@

$(TBARC):
	$(MAKE) -C $(TBDIR) $(TBLIB)

clean:
	$(MAKE) -C $(NJDIR) clean
	$(MAKE) -C $(TBDIR) clean
	rm -rf $(BUILDDIR)
	rm -rf $(BIN)

.PHONY: clean all
