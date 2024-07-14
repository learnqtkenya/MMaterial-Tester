#include "IconList.h"

IconListModel::IconListModel(QObject* parent)
	: QAbstractListModel(parent)
{
}

int IconListModel::rowCount(const QModelIndex& parent) const
{
	if (parent.isValid())
		return 0;

	return m_iconList.count();
}

QVariant IconListModel::data(const QModelIndex& index, int role) const
{
	if (!index.isValid() || role != Qt::DisplayRole)
		return QVariant();

	return m_iconList.at(index.row());
}

void IconListModel::addIcon(const QString& iconName)
{
	beginInsertRows(QModelIndex(), m_iconList.count(), m_iconList.count());
	m_iconList.append(iconName);
	endInsertRows();
}

void IconListModel::addIcons(const QStringList& iconNames)
{
	if (iconNames.isEmpty())
		return;

	beginInsertRows(QModelIndex(), m_iconList.count(), m_iconList.count() + iconNames.count() - 1);
	m_iconList.append(iconNames);
	endInsertRows();
}

void IconListModel::removeIcon(const QString& iconName)
{
	int index = m_iconList.indexOf(iconName);
	if (index != -1) {
		beginRemoveRows(QModelIndex(), index, index);
		m_iconList.removeAt(index);
		endRemoveRows();
	}
}

void IconListModel::clear()
{
	if (m_iconList.isEmpty())
		return;

	beginRemoveRows(QModelIndex(), 0, m_iconList.count() - 1);
	m_iconList.clear();
	endRemoveRows();
}

IconFilterProxyModel::IconFilterProxyModel(QObject* parent)
	: QSortFilterProxyModel(parent)
{
}

bool IconFilterProxyModel::filterAcceptsRow(int sourceRow, const QModelIndex& sourceParent) const
{
	QModelIndex index = sourceModel()->index(sourceRow, 0, sourceParent);
	QString iconName = index.data().toString();

	return iconName.contains(this->filterRegularExpression().pattern(), Qt::CaseInsensitive);
}

bool IconFilterProxyModel::lessThan(const QModelIndex& left, const QModelIndex& right) const
{
	QString leftData = left.data().toString();
	QString rightData = right.data().toString();

	return QString::localeAwareCompare(leftData, rightData) < 0;
}

IconList::IconList(QObject* parent)
	: QObject(parent)
{
	m_iconListModel = new IconListModel(this);
	m_iconFilterProxyModel = new IconFilterProxyModel(this);
	m_iconFilterProxyModel->setSourceModel(m_iconListModel);
	m_iconFilterProxyModel->setDynamicSortFilter(true);
}

QStringList IconList::iconList() const
{
	return m_iconList;
}

void IconList::setIconList(const QStringList& iconList)
{
	m_iconList = iconList;
	m_iconListModel->clear();
	m_iconListModel->addIcons(iconList);
	m_iconFilterProxyModel->invalidate();
}

IconListModel* IconList::iconListModel() const
{
	return m_iconListModel;
}

IconFilterProxyModel* IconList::iconFilterProxyModel() const
{
	return m_iconFilterProxyModel;
}
