cmake_minimum_required(VERSION 3.16)

project(QtApps VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

file(GLOB_RECURSE ICON_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    Resources/Icons/*.png
)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2 )

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appQtApps
    main.cpp
)

qt_add_qml_module(appQtApps
    URI QtApps
    VERSION 1.0
    QML_FILES
        Main.qml
    RESOURCES
        ${ICON_FILES}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQtApps PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQtApps
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQtApps
    PRIVATE Qt6::Quick
    Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS appQtApps
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
