PACKAGE_NAME?=	barnyard2

VERSION?=	$(shell git describe --abbrev=6 --tags HEAD --always | sed 's/-/_/g')

BUILD_NUMBER?= 1

MOCK_CONFIG?=default

RESULT_DIR?=pkgs

LATEST?=HEAD

all: rpm


SOURCES:
	mkdir -p SOURCES

archive: SOURCES
	cd ../../ && \
    tar --exclude=packaging/rpm/SOURCES --exclude=.git -cvf packaging/rpm/SOURCES/$(PACKAGE_NAME)-$(VERSION).tar.gz \
        --transform 's%^./%$(PACKAGE_NAME)-$(VERSION)/%' .
	#git archive --prefix=$(PACKAGE_NAME)-$(VERSION)/ \
	#	-o packaging/rpm/SOURCES/$(PACKAGE_NAME)-$(VERSION).tar.gz $(LATEST)


build_prepare: archive
	mkdir -p $(RESULT_DIR)
	rm -f $(RESULT_DIR)/$(PACKAGE_NAME)*.rpm


srpm: build_prepare
	/usr/bin/mock \
		-r $(MOCK_CONFIG) \
		--define "__version $(VERSION)" \
		--define "__release $(BUILD_NUMBER)" \
		--resultdir=$(RESULT_DIR) \
		--buildsrpm \
		--spec=${PACKAGE_NAME}.spec \
		--sources=SOURCES
	@echo "======= Source RPM now available in $(RESULT_DIR) ======="

rpm: srpm
	/usr/bin/mock \
		-r $(MOCK_CONFIG) \
		--define "__version $(VERSION)"\
		--define "__release $(BUILD_NUMBER)"\
		--resultdir=$(RESULT_DIR) \
		--rebuild $(RESULT_DIR)/$(PACKAGE_NAME)*.src.rpm
	@echo "======= Binary RPMs now available in $(RESULT_DIR) ======="

clean:
	rm -rf SOURCES pkgs
