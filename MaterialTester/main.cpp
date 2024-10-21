#include <QDirIterator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "DevTools/Clipboard.h"
#include "DevTools/CustomEngine.h"

int main(int argc, char *argv[])
{
//   qputenv("QSG_VISUALIZE", "batches");

	qputenv("MAIN_QML","../../../MaterialTester/Main.qml");

    QGuiApplication app(argc, argv);

	// output qrc files:
	// {
	// 	qDebug() << "qrc files:";
	// 	QDirIterator it(":", QDirIterator::Subdirectories);
	// 	while (it.hasNext()) {
	// 		const auto path = it.next();
	// 		const auto file = QFile(path);
	// 		qDebug() << QString("%1 kb - %2")
	// 					.arg(file.size() / 1024, 6)
	// 					.arg(path);
	// 	}
	// }

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
