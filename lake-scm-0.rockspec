package = 'lake'

version = 'scm-0'

source = {
    url = "https://github.com/stevedonovan/Lake/archive/master.zip",
    dir = 'Lake-master'
}

description = {
    summary = 'A Lua-based Build Tool',
    detailed = [[
lake is a build engine in Lua, which directly executes
dependency rules. Provides cross-platform support for both GCC
and MSVC compilers, particularly for building Lua C
extensions.
    ]],
    license = 'MIT/X11',
    homepage = "https://stevedonovan.github.com/lake/",
    maintainer = "steve.j.donovan@gmail.com"
}

dependencies = {
    "luafilesystem"
}

build = {
    type = 'none',
    install = {
        bin = {'lake' }
    }
}