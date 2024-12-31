#pragma once

#include <QClipboard>
#include <QGuiApplication>
#include <qqmlintegration.h>

class Clipboard : public QObject
{
	Q_OBJECT
	QML_ELEMENT
	QML_SINGLETON

public:
	Clipboard(QObject* parent = nullptr) : QObject(parent) {}

	Q_INVOKABLE void setText(const QString& text)
	{
		QClipboard* clipboard = QGuiApplication::clipboard();
		clipboard->setText(text);
	}
};
