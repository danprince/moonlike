BUILD_DIR = build
SRC_DIR = .

build:
	moonc -t $(BUILD_DIR) $(SRC_DIR)/*.moon
	make static

clean:
	rm -rf $(BUILD_DIR)

static:
	cp -r static/* $(BUILD_DIR)

watch:
	moonc -t $(BUILD_DIR) -w $(SRC_DIR)/

install:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR)
	git clone git://github.com/paulofmandown/rotLove.git ./$(BUILD_DIR)/rotLove
	make build

run:
	love $(BUILD_DIR)

lint:
	moonc -l $(SRC_DIR)/*.moon

