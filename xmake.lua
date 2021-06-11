add_rules("mode.debug", "mode.release")
add_repositories("my-repo git@github.com:Moon-Ocean/xmake-repo.git")
add_requires("RobinLog"  , {debug = is_mode("debug")})

add_includedirs("include")

target("OwlKeyLog")
    add_rules("qt.shared")
    add_packages("RobinLog")
    add_defines("OWLKEYLOG_LIB")
    add_headerfiles("include/*.h")
    add_frameworks("QtWidgets", "QtGui")
    add_files("src/*.cpp") 
    add_files("include/*.h")

target("test")
    set_default(false)
    add_rules("qt.console")
    add_frameworks("QtWidgets", "QtGui")
    add_deps("OwlKeyLog")
    add_files("test/main.cpp")
    add_files("test/mainwindow.ui")
    add_files("test/*.cpp")
    -- add files with Q_OBJECT meta (only for qt.moc)
    add_files("test/mainwindow.h")