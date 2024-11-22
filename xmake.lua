add_requires("freetype", "tinyxml2")
if is_plat("linux") then
    add_requires("freetype2")
end
target("msdf-atlas-gen")
set_kind("static")
add_packages("freetype", "tinyxml2")

add_includedirs(
    ".",
    "msdfgen",
    "msdf-atlas-gen",
    "msdfgen/core",
    "msdfgen/ext",
    "artery-font-format",
    { public = true }
)

if is_plat("linux") then
    add_packages("freetype2")
    add_includedirs("/usr/include/freetype2")
end
add_cxflags("/MD")
add_cxflags("/utf-8", "/wd4828", "/wd4251", "/D_ITERATOR_DEBUG_LEVEL=0")
add_files(
    "msdfgen/*.cpp",
    "msdfgen/core/*.cpp",
    "msdfgen/ext/*.cpp",
    "msdf-atlas-gen/*.cpp"
) 

set_languages("cxx20")
