#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "DevTools/Clipboard.h"
#include "DevTools/CustomEngine.h"

int main(int argc, char *argv[])
{
//   qputenv("QSG_VISUALIZE", "batches");

#ifdef Q_OS_WIN
    qputenv("MAIN_QML","../MaterialTester/Main.qml");
#else
	qputenv("MAIN_QML","../../../MaterialTester/Main.qml");
#endif
    QGuiApplication app(argc, argv);

    CustomEngine engine;
	Clipboard clipboard;

	engine.addImportPath(":/MMaterial"); // for Material
	engine.addImportPath("qrc:/");

    engine.rootContext()->setContextProperty("QmlEngine", &engine);
	engine.rootContext()->setContextProperty("Clipboard", &clipboard);

#if defined(__wasm__) || !defined(QT_DEBUG)
    const QUrl url(u"qrc:/MaterialTester/Main.qml"_qs);
#else
    const QUrl url(qgetenv("MAIN_QML"));
#endif
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
