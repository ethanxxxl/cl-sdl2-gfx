(cl:in-package :sdl2-gfx)

(autowrap:c-include
 '(sdl2-gfx autowrap-spec "SDL2_gfx_all_modules.h")
 :spec-path '(sdl2-gfx autowrap-spec)
 :exclude-sources ("/usr/local/lib/clang/([^/]*)/include/(?!stddef.h)"
                   "/usr/include/"
                   "/usr/include/arm-linux-gnueabihf"
                   "/usr/include/X11/")
 :include-sources ("/usr/include/SDL2/SDL2_rotozoom.h"
                   "/usr/include/SDL2/SDL2_gfxPrimitives.h"
                   "/usr/include/SDL2/SDL2_framerate.h"
                   "/usr/include/SDL2/SDL2_imageFilter.h"
                   "/usr/include/SDL2/SDL2_gfxPrimitives_font.h")
 :exclude-definitions ("SDL_LogMessageV"
                       "SDL_vsnprintf"
                       "_inline$"
                       "^_mm_")
 :include-definitions ("^XID$" "^Window$" "^Display$" "^_XDisplay$")
 :symbol-exceptions (("T" . "Thresh")) ;; imageFilterBinarizeUsingThreshold has
                                       ;; a parameter named T that clashes with
                                       ;; COMMON-LISP:T
 :release-p cl:t
 :no-accessors cl:t)
