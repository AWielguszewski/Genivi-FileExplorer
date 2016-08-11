
#include <QApplication>
#include <QQuickView>

#include "main.h"

#define QML_EXAMPLE_SURFACE_ID 40

int main(int argc, char *argv[])
{
    setenv("QT_QPA_PLATFORM", "wayland", 1); // force to use wayland plugin
    setenv("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1", 1);

    QObject *object;
    QGuiApplication app(argc, argv);
    QQuickView view(QUrl(QStringLiteral("qrc:/main.qml")));
    object = (QObject *)view.rootObject();

    MyClass myClass;
    QObject::connect(object, SIGNAL(qmlSignal(QString)),
                     &myClass, SLOT(cppSlot(QString)));

    view.setProperty("IVI-Surface-ID", QML_EXAMPLE_SURFACE_ID);
    view.show();

    return app.exec();
}
