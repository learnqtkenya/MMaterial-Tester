#ifndef CUSTOMENGINE_H
#define CUSTOMENGINE_H

#pragma once

#include <QQmlApplicationEngine>
#include "FileWatcher.h"

// Will be depricated soon
class CustomEngine : public QQmlApplicationEngine
{
	Q_OBJECT
public:
	explicit CustomEngine(QObject *parent = Q_NULLPTR);

	Q_INVOKABLE void clearCache();

Q_SIGNALS:
	void reloadUI();

private:
	FileWatcher* m_fileWatcher;
};

#endif // CustomEngine_H
