
import sdl2
from dadren/textures import newTextureManager, load, render


proc handleEvents(): bool =
    var event = sdl2.defaultEvent
    sdl2.pollEvent(event) and event.kind == sdl2.QuitEvent


sdl2.init(sdl2.INIT_EVERYTHING)

let
    window = sdl2.createWindow("Texture loader", 0, 0, 640, 480, sdl2.SDL_WINDOW_SHOWN)
    display = sdl2.createRenderer(window, -1, sdl2.Renderer_Accelerated)
    tm = newTextureManager(window, display)
    plants = tm.load("plants", "plants.png")


while true:

    render(display, plants,
        sx=0, sy=0,
        dx=0, dy=0,
        width=plants.size.w,
        height=plants.size.h)

    sdl2.present(display)

    if handleEvents():
        break


sdl2.quit()
