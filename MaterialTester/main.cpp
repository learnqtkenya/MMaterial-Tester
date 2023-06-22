#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "DevTools/CustomEngine.h"

int main(int argc, char *argv[])
{
    qputenv("MAIN_QML","../MaterialTester/Main.qml");
    QGuiApplication app(argc, argv);

    CustomEngine engine;

    engine.addImportPath("../../Material-Qt/MMaterial"); // for Material
    engine.rootContext()->setContextProperty("QmlEngine", &engine);

    const QUrl url(qgetenv("MAIN_QML"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
