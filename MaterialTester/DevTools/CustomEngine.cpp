#include "CustomEngine.h"

CustomEngine::CustomEngine(QObject *parent) :
    QQmlApplicationEngine(parent)
{
#ifdef QT_DEBUG
    m_fileWatcher = new FileWatcher(this);

    QObject::connect(m_fileWatcher, &FileWatcher::reloadUI, this, &CustomEngine::reloadUI);
#endif
}

void CustomEngine::clearCache()
{
    this->clearComponentCache();
}
