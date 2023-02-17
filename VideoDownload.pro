QT += quick \
      webenginewidgets \
        xml

CONFIG += c++11
TARGET = VideoDownload
# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

RESOURCES += qml.qrc

CONFIG -= qml_debug

macx {
#    ICON = $${PWD}/mac/icon.icns
#    QMAKE_INFO_PLIST=$${PWD}/Info.plist

    #for fixxing codesign error when compile
    Q_XCODE_OTHER_CODE_SIGN_FLAGS.name = OTHER_CODE_SIGN_FLAGS
    Q_XCODE_OTHER_CODE_SIGN_FLAGS.value = "--deep"
    QMAKE_MAC_XCODE_SETTINGS += Q_XCODE_OTHER_CODE_SIGN_FLAGS

    #for changing target built dir
    Q_XCODE_CONFIGURATION_BUILD_DIR.name = CONFIGURATION_BUILD_DIR
    Q_XCODE_CONFIGURATION_BUILD_DIR.value = $(BUILD_DIR)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)
    QMAKE_MAC_XCODE_SETTINGS += Q_XCODE_CONFIGURATION_BUILD_DIR

#    SOURCES += command/mac_sysinfo.mm
#    SOURCES += mac/macMenu.mm
#    SOURCES += mac/macUtils.mm

#    HEADERS += mac/macMenu.h
#    HEADERS += mac/menuInfo.h

    LIBS += $${PWD}/lib/libToou2D.a
    CONFIG += resources_big
}

win32 {
    LIBS += $${PWD}/lib/Toou2D.lib
    CONFIG += resources_big

    DESTDIR = $${PWD}/../Output/Release
}
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


HEADERS += toou2D/Toou2D.h
