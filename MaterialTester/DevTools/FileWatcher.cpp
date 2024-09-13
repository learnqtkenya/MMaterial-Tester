#include "FileWatcher.h"
#include <thread>
/**
 * @brief FileWatcher::FileWatcher
 *   This class can monitor file changes in a directory and calls a callback
 *   in response
 * @param callback
 *   The callback function to be executed whenever changes are detected
 */
FileWatcher::FileWatcher(QObject* parent) : QObject(parent)
{
    QObject::connect(&m_watcher, &QFileSystemWatcher::directoryChanged, this, &FileWatcher::directoryChanged);
    QObject::connect(&m_watcher, &QFileSystemWatcher::fileChanged, this, &FileWatcher::fileChanged);

    // configure the timer to signal the changes to the callback
    m_timer.setInterval(150);
    m_timer.setSingleShot(true);

    // connect timer to callback function
    QObject::connect(&m_timer, &QTimer::timeout, this, &FileWatcher::reloadUI);

#ifdef Q_OS_WIN
    setDirectory(QDir::currentPath()+QDir::separator()+".."+QDir::separator()+ QString("MMaterial"));
    setDirectory(QDir::currentPath()+QDir::separator()+".."+QDir::separator()+ QString("MaterialTester"));
#else
	setDirectory(QDir::currentPath()+QDir::separator()+"../../../"+QDir::separator()+ QString("MMaterial"));
	setDirectory(QDir::currentPath()+QDir::separator()+"../../../"+QDir::separator()+ QString("MaterialTester"));
#endif
}

/**
 * @brief FileWatcher::addPaths
 *   Adds the paths of the files to be monitored in the current directory
 */
void FileWatcher::addPaths(QDir &directory)
{
    //Add qml files from current directory
    QStringList qmlFiles = directory.entryList(QStringList() << "*.qml");
    for (int i = 0; i < qmlFiles.count(); i++)
        qmlFiles[i].prepend(directory.absolutePath() + "/");

    if(qmlFiles.count() > 0)
        m_watcher.addPaths(qmlFiles);

    //Go deeper into the directory structure
    QStringList directories = directory.entryList(QStringList() << "*", QDir::Dirs | QDir::NoSymLinks | QDir::NoDotAndDotDot);
    //Setting directories
    for(int i = 0; i < directories.count(); i++){
        directories[i].prepend(directory.absolutePath() + "/");
        QDir directory(directories[i]);
        addPaths(directory);
    }
}

/**
 * @brief FileWatcher::setDirectory
 *   Set the directory to watch for changes
 * @param path
 *   Directory path
 */
void FileWatcher::setDirectory(const QString &path)
{

    QDir projectDir = QDir(path);

    if(!projectDir.exists()){
        qWarning() << "Directory " << path << " doesn't exist. Live reload will not work. (Shadow build should be enabled)";
        return;
    }
    qDebug() << "Directory for file watcher set to: " << path;

    m_dir = projectDir;
    addPaths(m_dir);
    qInfo() << "Finished! Number of qml files watched by file watcher: " << m_watcher.files().count();
}

/**
 * @brief FileWatcher::directoryChanged
 *   Slot connected to the directoryChanged signal from internal QFileSystemWatcher
 * @param path
 *   Path of the directory where the change was detected
 */
void FileWatcher::directoryChanged(const QString &path)
{
    Q_UNUSED(path);
    qDebug() << "Directory changed";
    m_watcher.removePaths(m_watcher.files());
    addPaths(m_dir);
}

/**
 * @brief FileWatcher::fileChanged
 *   Slot connected to the fileChanged signal from internal QFileSystemWatcher
 * @param path
 *   Path of the file where the change was detected
 */
void FileWatcher::fileChanged(const QString &path)
{
    QFileInfo checkFile(path);
    while(!checkFile.exists())
        std::this_thread::sleep_for(std::chrono::milliseconds(10));
    m_watcher.addPath(path);
    m_timer.start();
}
