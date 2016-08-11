
TEMPLATE = app


QT += qml quick widgets multimedia

SOURCES   += main.cpp
HEADERS   += main.h
RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

LIBS      += -lsystemd

target.path = /usr/bin

# enable C standard as published in 2011 as ISO/IEC 9899:2011 (known as C11)
CONFIG     += c++11

# Default rules for deployment.
include(deployment.pri)
