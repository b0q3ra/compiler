# Define the C++ compiler
CXX = g++

# Define compiler flags
CXXFLAGS = -std=c++17 -Wall -Iheaders

# Directories
SRC_DIR = src
HDR_DIR = headers
BIN_DIR = bin
OBJ_DIR = obj

# Source files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRCS))

# Main executable
TARGET = $(BIN_DIR)/main

# Default target
all: $(TARGET)

# Rule to create the bin and obj directories if they don't exist
$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

# Rule to build the main executable
$(TARGET): $(OBJS) $(OBJ_DIR)/main.o | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Rule to compile the main source file
$(OBJ_DIR)/main.o: main.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Rule to compile all other source files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Phony targets
.PHONY: all clean

# Clean rule
clean:
	rm -f $(TARGET) $(OBJS) $(OBJ_DIR)/*.o
	rmdir -p $(OBJ_DIR) $(BIN_DIR) 2>/dev/null || true