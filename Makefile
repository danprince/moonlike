BUILD_DIR = build
SRC_DIR = .

# compile moonscript and copy static
build:
	moonc -t $(BUILD_DIR) $(SRC_DIR)/*.moon
	make static

# clean build directory
clean:
	rm -rf $(BUILD_DIR)

# copy static (broken)
static:
	cp -r static/* $(BUILD_DIR)

# recompiles moonscript on change
watch:
	moonc -t $(BUILD_DIR) -w $(SRC_DIR)/

# installs dependencies and makes initial build
install:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR)
	git clone git://github.com/paulofmandown/rotLove.git ./$(BUILD_DIR)/rotLove
	make build

# starts the game
run:
	love $(BUILD_DIR)

# lints code (broken)
lint:
	moonc -l $(SRC_DIR)/*.moon

