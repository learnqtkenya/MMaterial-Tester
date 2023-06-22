#ifndef FILEWATCHER_H
#define FILEWATCHER_H

#include <functional>
#include <QFileSystemWatcher>
#include <QDir>
#include <QTimer>


class QString;

class FileWatcher : public QObject
{
    Q_OBJECT
public:
    FileWatcher(QObject* parent);

    void setDirectory(const QString &path);

public Q_SLOTS:
    void directoryChanged(const QString &path);
    void fileChanged(const QString &path);

Q_SIGNALS:
    void reloadUI();

private:
    void addPaths(QDir &directory);

private:
    QFileSystemWatcher m_watcher;
    QDir m_dir;
    QTimer m_timer;
};

#endif // FILEWATCHER_H
