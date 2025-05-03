RAW = raw.csv
TRIMMED = trimmed.csv
CLEAN = clean.csv

.PHONY: all clean
all: $(CLEAN)
        $(MAKE) clean

$(TRIMMED): $(RAW)
        rm -f $(TRIMMED)
        cut -d',' -f1,3,5 $(RAW) > $(TRIMMED)

$(CLEAN): $(TRIMMED)
        awk -F, '{ if ( $$2 != "" && $$3 != "") print $$0 }' $(TRIMMED) > $(CLEAN)

clean:
        rm -f $(TRIMMED)

