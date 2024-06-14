CC=g++
INCLUDE_DIR = -I./
INCLUDE_DIR+= -I./depends/raylib/raylib/include
INCLUDE_DIR+= -I./depends/raygui/src
LIBRARY_DIR = -L./depends/raylib/raylib
LIBRARY_DIR+= -L./depends/raylib/raylib/external/glfw/src
LIBRARY_LINK = -lraylib -lglfw3 -ldl -pthread
BUILD_DEP = $(INCLUDE_DIR) $(LIBRARY_DIR) $(LIBRARY_LINK)

all: mmatching

clean:
	-rm mmatching

mmatching:
	$(CC) controller.cpp -o $@ $(BUILD_DEP)

run:
	./mmatching;



build_depends:
	mkdir -p depends/raygui
	mkdir -p depends/raylib
	git clone --depth 1 git@github.com:raysan5/raylib.git depends/raylib
	git clone --depth 1 git@github.com:raysan5/raygui depends/raygui
	cd depends/raylib && cmake . && make

patch-back:
	mv controller.old.c controller.c


.SILENT: clean