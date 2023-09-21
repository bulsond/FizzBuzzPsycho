.PHONY: setup debug release clean format

# Build directory
BUILD_DIR := build

# Default build
all: release

# Prepare
setup:
	@pre-commit install

# Build server library
debug: _prepare-build-dir
	@echo "Building debug..."
	@cd $(BUILD_DIR) && cmake -G "Ninja" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug .. && ninja
	@echo "Make a link to compile_commands.json"
	@rm -f compile_commands.json && ln -s build/compile_commands.json compile_commands.json

# Build server library
release: _prepare-build-dir
	@echo "Building release..."
	@cd $(BUILD_DIR) && cmake -G "Ninja" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release .. && ninja
	@echo "Make a link to compile_commands.json"
	@rm -f compile_commands.json && ln -s build/compile_commands.json compile_commands.json

# Clean build
clean:
	@rm -rf build/

# Run tests
#test: debug
#	@echo "Running tests..."
#	@(cd $(BUILD_DIR) && ctest --verbose)

# Format code
format:
	@clang-format -i -style=file library/*.c
	@clang-format -i -style=file library/*.h
	@dart format -l 80 --fix .
	@dart fix --apply .

# Prepare build directory
_prepare-build-dir:
	@mkdir $(BUILD_DIR) || true