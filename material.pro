QT += quick

CONFIG += c++11

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

RESOURCES += qml.qrc \
    resoces1.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
QT += 3dcore 3drender 3dinput 3dlogic 3dextras qml quick 3dquick 3danimation
RC_ICONS = changlu.ico
DISTFILES += \
    F:/无定义/three.js-master/three.js-master/.gitignore \
    F:/无定义/three.js-master/three.js-master/.npmignore \
    F:/无定义/three.js-master/three.js-master/CONTRIBUTING.md \
    F:/无定义/three.js-master/three.js-master/LICENSE \
    F:/无定义/three.js-master/three.js-master/README.md \
    F:/无定义/three.js-master/three.js-master/bower.json \
    F:/无定义/three.js-master/three.js-master/package.json \
    three.js-master/three.js-master/build/Qt5.6_three.js_r71/three.js
