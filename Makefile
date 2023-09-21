.PHONY: all setup ffi-debug ffi-release clean get test analyze check format _prepare-build-dir

# Build directory
BUILD_DIR := build

# Default build
all: release

# Prepare
setup:
	@pre-commit install

# Build server library
ffi-debug: _prepare-build-dir
	@echo "Building debug..."
	@cd $(BUILD_DIR) && cmake -G "Ninja" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug .. && ninja
	@echo "Make a link to compile_commands.json"
	@rm -f compile_commands.json && ln -s build/compile_commands.json compile_commands.json

# Build server library
ffi-release: _prepare-build-dir
	@echo "Building release..."
	@cd $(BUILD_DIR) && cmake -G "Ninja" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release .. && ninja
	@echo "Make a link to compile_commands.json"
	@rm -f compile_commands.json && ln -s build/compile_commands.json compile_commands.json

# Clean build
clean:
	@rm -rf build/

# Get dependencies
get:
	@dart pub get

# Run tests
test: get
	@dart test --debug --coverage=.coverage --platform vm

# Analyze code
analyze: get format
	@echo "Analyze the code"
	@dart analyze --fatal-infos --fatal-warnings

# Check code
check: analyze
	@dart pub publish --dry-run
	@dart pub global activate pana
	@pana --json --no-warning --line-length 80 > log.pana.json

# Format code
format:
	@clang-format -i -style=file library/*.c
	@clang-format -i -style=file library/*.h
	@dart format -l 80 --fix .
	@dart fix --apply .

# Prepare build directory
_prepare-build-dir:
	@mkdir $(BUILD_DIR) || true
